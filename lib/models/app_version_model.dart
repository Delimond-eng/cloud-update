class AppVersionModel {
  String name;
  int version;
  List<String> description;
  String macosFileName;
  String windowsFileName;

  AppVersionModel({
    this.name,
    this.version,
    this.description,
    this.macosFileName,
    this.windowsFileName,
  });

  AppVersionModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    version = json['version'];
    description = json['description'].cast<String>();
    macosFileName = json['macos_file_name'];
    windowsFileName = json['windows_file_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['version'] = version;
    data['description'] = description;
    data['macos_file_name'] = macosFileName;
    data['windows_file_name'] = windowsFileName;
    return data;
  }
}
