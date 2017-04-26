abstract class LParser<T> {
  T parse(String line);
}

class SParser implements LParser {
  String parse(String line) => '* $line *';
}

class NParser implements LParser {
  num parse(String line) => num.parse(line) + 1;
}

class FParser<T> {
  LParser lParser;
  List<String> lines;
  List<T> results = new List<T>();

  parse() {
    for (var line in lines) {
      T element = lParser.parse(line);
      if (element != null) {
        results.add(element);
      }
    }
  }
}


main(List<String> arguments) {
  print('Generic test');
  var sParser  = new FParser<String>()
  ..lParser = new SParser()
  ..lines = ['apple', 'pear', 'orange'];

  sParser.parse();
  sParser.results.forEach(print);

  var nParser  = new FParser<num>()
  ..lParser = new NParser()
  ..lines = ['3.14', '20', '10'];

  nParser.parse();
  nParser.results.forEach(print);

}
