import 'dart:developer';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class FilesService {
  static int _getFileId(String fileName) {
    final id = fileName.substring(4, fileName.length - 4);
    return int.parse(id);
  }

  static Future<int> _getNewFileId() async {
    try {
      List<int> ids = [];
      final docDir = await path_provider.getApplicationDocumentsDirectory();
      final myFilesDir = Directory('${docDir.path}/myFiles');
      final filesList = myFilesDir.list();
      await filesList.forEach((file) {
        final fileName = basename(file.path);
        log('name:$fileName');
        final id = _getFileId(fileName);
        ids.add(id);
      });
      ids.sort();
      log('ids : $ids');
      final newId = ids.last + 1;
      return newId;
    } catch (e) {
      log(e.toString());
      return 0;
    }
  }

  static Future<bool> createNewFile() async {
    try {
      final docDir = await path_provider.getApplicationDocumentsDirectory();
      final newId = await _getNewFileId();
      final newFilePath = '${docDir.path}/myFiles/file$newId.txt';
      final newFile = File(newFilePath);
      await newFile.writeAsString('start');
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> writeToFile({
    required String fileName,
    required String text,
  }) async {
    try {
      final docDir = await path_provider.getApplicationDocumentsDirectory();

      final filePath = '${docDir.path}/myFiles/$fileName';

      final File file = File(filePath);
      String content = await file.readAsString();
      content += '\n$text';
      await file.writeAsString(content);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<String> readFile({
    required String fileName,
  }) async {
    try {
      print(fileName);
      final docDir = await path_provider.getApplicationDocumentsDirectory();
      final path = '${docDir.path}/myFiles/$fileName';
      final File file = File(path);
      final content = await file.readAsString();
      return content;
    } catch (e) {
      return e.toString();
    }
  }

  static Future<List<String>> getFiles() async {
    try {
      final List<String> filesNames = [];
      final dir = await path_provider.getApplicationDocumentsDirectory();
      final myFilesPath = '${dir.path}/myFiles';
      final Directory myDir = Directory(myFilesPath);
      await myDir.create();

      Stream<FileSystemEntity> files = myDir.list();
      await files.forEach((file) async {
        log('file path : ${file.path}');
        final fileName = basename(file.path);
        filesNames.add(fileName);
      });

      return filesNames;
    } catch (e) {
      log('e : ${e.toString()}');
      return [];
    }
  }

  static Future<bool> deleteFile({
    required String fileName,
  }) async {
    try {
      final docDir = await path_provider.getApplicationDocumentsDirectory();
      final file = File('${docDir.path}/myFiles/$fileName');
      await file.delete();
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
