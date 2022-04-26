///
/// This example shows off fetching songs from MediaStore with [AndroidContentResolver].
///
///

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:android_content_provider/android_content_provider.dart';

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
  List<List<Object?>>? songs;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    final cursor = await AndroidContentResolver.instance.query(
      uri:
          'content://com.nt4f04und.android_content_provider_example.MyAndroidContentProvider',
      projection: null,
      selection: null,
      selectionArgs: null,
      sortOrder: null,
    );

    try {
      // if (await cursor!.moveToFirst()) {
      print((await cursor!.batchedGet().getString(1).commitRange(0, 1))
          .first
          .first);

      // }
    } finally {
      cursor?.close();
    }
  }

  Future<void> measure(Function callback) async {
    final s = Stopwatch();
    s.start();
    await callback();
    s.stop();
    print('elapsed ${s.elapsedMilliseconds}');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AndroidContentProvider plugin example'),
        ),
        body: songs == null
            ? const SizedBox.shrink()
            : ListView.builder(
                itemExtent: 50,
                itemCount: songs!.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(songs![index].last as String),
                ),
              ),
      ),
    );
  }
}
