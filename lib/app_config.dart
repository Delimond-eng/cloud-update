import 'dart:convert';
import 'dart:io';

import 'package:cloud_update/models/app_version_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as Api;
import 'package:path_provider/path_provider.dart';

class AppConfig {
  static double currentVersion = 1.0;

  static Future downloadLastAppVersion(String appPath) async {
    final fileName = appPath.split("/").last;
    String downloadFilePath =
        "${(await getApplicationDocumentsDirectory()).path}/$fileName";
    final dio = Dio();

    await dio.download(
      "url path",
      downloadFilePath,
    );
  }

  static Future<void> openExeFile(String filePath) async {
    await Process.start(filePath, ["-t", "-l", "1000"]).then((value) {});
  }

  static Future<AppVersionModel> loadVersionFromCloud() async {
    final response = await Api.read(Uri.parse("git link"));
    return jsonDecode(response);
  }
}
