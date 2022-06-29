import 'dart:convert';
import 'dart:io';

import 'package:cloud_update/models/app_version_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as api;
import 'package:path_provider/path_provider.dart';

class AppConfig {
  static double currentVersion = 1.0;

  static Future downloadLastAppVersion(String appPath) async {
    final fileName = appPath.split("/").last;
    String downloadFilePath =
        "${(await getApplicationDocumentsDirectory()).path}/$fileName";
    final dio = Dio();
    await dio.download(
      "https://github.com/Delimond-eng/cloud-update/app_versions_check/$appPath",
      downloadFilePath,
      onReceiveProgress: (count, total) => () {
        final progress = (count / total) * 100;
        print('Rec : $count, Total: $total, $progress');
      },
    );
    print('File downloaded : $downloadFilePath');

    if (Platform.isWindows) {
      openExeFile(downloadFilePath);
    }
  }

  static Future<void> openExeFile(String filePath) async {
    await Process.start(filePath, ["-t", "-l", "1000"]).then((value) {});
  }

  static Future<AppVersionModel> loadVersionFromCloud() async {
    final response = await api.read(
      Uri.parse(
          "https://github.com/Delimond-eng/cloud-update/app_versions_check/version.json"),
    );
    print(response);
    return jsonDecode(response);
  }
}
