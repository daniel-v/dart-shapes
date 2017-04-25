abstract class LineParser {
  parse(String line);
}

class SuperLineParser implements LineParser {
  parse(String line) {
    print(line);
  }
}

class FileParser {
  LineParser _lineParser;
  FileParser(this._lineParser) { }
  readFile() {
    _lineParser.parse('hello');
  }
}

main(List<String> arguments) {
  print('Interface test');
  FileParser fileParser = new FileParser(new SuperLineParser());
  fileParser.readFile();
}
