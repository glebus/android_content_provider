///
/// This example shows off fetching songs from MediaStore with [AndroidContentResolver].
///
///

import 'package:android_content_provider_example/content_provider.dart';
import 'package:flutter/material.dart';

@pragma('vm:entry-point')
void exampleContentProviderEntrypoint() {
  MyAndroidContentProvider(
      "com.nt4f04und.android_content_provider_example.MyAndroidContentProvider");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('AndroidContentProvider plugin example'),
          ),
          body: const SizedBox.shrink()),
    );
  }
}
