import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

import 'dart:async';
import 'package:http/http.dart' as http;

class PdfApi {
  String path = "";
  static Future<File> generateCenteredText(String text) async {
    final pdf = Document();

    pdf.addPage(Page(
      build: (context) => Center(
        child: Text(text, style: TextStyle(fontSize: 48)),
      ),
    ));

    return saveDocument(name: 'my_example.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future<File> loadNetwork(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    return _storeFile(url, bytes);
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }

  static Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = url;
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  Future<void> downloadFile(String path) async {
  FirebaseStorage storage = FirebaseStorage.instance;
  Reference ref = storage.ref().child("prescription/" + path);  


  final Directory appDocDir = await getApplicationDocumentsDirectory();
  final String appDocPath = appDocDir.path;
  final File tempFile = File(appDocPath + '/' + 'Pedoman_Pemantauan.pdf');
  try {
    await ref.writeToFile(tempFile);
    await tempFile.create();
    await OpenFile.open(tempFile.path);
  } on FirebaseException{
    print("error");
  };
  }
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text(
    //       'Error, file tidak bisa diunduh',
    //       style: Theme.of(context).textTheme.bodyText1,
    //     ),
    //   ),
    // );
  
  // ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content:Text(
  //         'File Berhasil diunduh',
  //         style: Theme.of(context).textTheme.bodyText1,
  //         ),
  //         behavior: SnackBarBehavior.floating,
  //         backgroundColor: Theme.of(context).primaryColorLight,
  //         shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(30.0))),
}

