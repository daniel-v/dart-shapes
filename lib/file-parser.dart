import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:dart_shapes/line-parser.dart';

class FileParser {
  String _filename;
  LineParser _lineParser;

  FileParser(this._filename, this._lineParser) {}

  parse() async {
    Stream lines = new File(_filename)
        .openRead()
        .transform(UTF8.decoder)
        .transform(const LineSplitter());
    await for (var line in lines) {
      _lineParser.parse(line);
    }
  }
}
