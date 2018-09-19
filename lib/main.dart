import 'package:flutter/material.dart';
import 'pages/JHNewVersionPage.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants/Constant.dart';


void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  Future<bool> _isNewVersion;

  @override
  void initState() {
    super.initState();
    _isNewVersion = _checkAppVersion().then(
        (bool result) {
          return result;
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "MyApp",
      home: new Container(
        child: new FutureBuilder<bool>(
          future: _isNewVersion,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return new Container();
              } else {
                if (snapshot.data) {
                  return new Container(color: Colors.blue,);
                } else {
                  return JHNewVersionPage();
                }
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Future<bool> _checkAppVersion() async {

    final PackageInfo info = await PackageInfo.fromPlatform();
    final version = info.version;
    final buildNumber = info.buildNumber;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final savedVersion = prefs.getString(Constant.kAppVersion);
    final savedBuildNumber = prefs.getString(Constant.kAppBuildNumber);

    if (version == savedVersion && buildNumber == savedBuildNumber) {
      return true;
    } else {
      prefs.setString(Constant.kAppVersion, version);
      prefs.setString(Constant.kAppBuildNumber, buildNumber);
      return false;
    }
  }

}

