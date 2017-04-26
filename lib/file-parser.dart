import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:dart_shapes/line-parser.dart';

class FileParser<T> {
  String _fileName;
  LineParser _lineParser;
  List<T> entities = new List<T>();

  set fileName(String fileName) => this._fileName = fileName;
  set lineParser(LineParser lineParser) => this._lineParser = lineParser;

  Future<List<T>> parse() async {
    Stream lines = new File(_fileName)
        .openRead()
        .transform(UTF8.decoder)
        .transform(const LineSplitter());
    await for (var line in lines) {
      T entity = _lineParser.parse(line);
      if (entity != null) {
        entities.add(entity);
      }
    }
    return entities;
  }
}
