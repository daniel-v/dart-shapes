import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:dart_shapes/line-parser.dart';

class FileParser<T> {

  final String fileName;
  final LineParser<T> lineParser;

  List<T> entities = new List<T>();

  FileParser(this.fileName, this.lineParser);

  Future<List<T>> parse() async {
    Stream lines = new File(fileName)
        .openRead()
        .transform(UTF8.decoder)
        .transform(const LineSplitter());
    await for (var line in lines) {
      T entity = lineParser.parse(line);
      if (entity != null) {
        entities.add(entity);
      }
    }
    return entities;
  }
}
