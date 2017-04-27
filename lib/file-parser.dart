import 'dart:io';
import 'dart:convert';

import 'package:dart_shapes/line-parser.dart';

class FileParser<T> {

  final String fileName;
  final LineParser<T> lineParser;

  List<T> entities = new List<T>();

  FileParser(this.fileName, this.lineParser);

  Iterable<T> parse() sync* {
    entities = LineSplitter
        .split(new File(fileName).readAsStringSync())
        .map((line) => lineParser.parse(line))
        .toList(growable: false);
    yield* entities;
  }
}
