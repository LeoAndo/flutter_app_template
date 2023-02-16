// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
    Logger().d('===============env variable info===============');
    Logger().d(const String.fromEnvironment('flavor'));
    Logger().d(const String.fromEnvironment('flutterAppName'));
    Logger().d(const String.fromEnvironment('flutterApplicationIdSuffix'));
    Logger().d(const String.fromEnvironment('accessToken'));
    Logger().d(const String.fromEnvironment('apiDomain'));
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    Logger().d('===============package info===============');
    Logger().d(info.packageName);
    Logger().d(info.version);
    Logger().d(info.buildNumber);
    Logger().d(info.buildSignature);
    Logger().d(info.installerStore ?? 'not available');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
