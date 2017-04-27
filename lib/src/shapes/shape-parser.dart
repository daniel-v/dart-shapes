part of shapes;

typedef Shape shapeContructor(Iterable<Lexeme> lexemes);

class ShapeParser implements LineParser<Shape> {

  Shape parse(String line) {
    Iterable<Lexeme> lexemes = line
        .split(' ')
        .map((part) => new Lexeme.fromString(part));
    return _shapeByLexeme[lexemes.first](lexemes);
  }

  static final Map<Lexeme, shapeContructor> _shapeByLexeme = <Lexeme, shapeContructor>{
    new Lexeme.fromString('square'): Square.createNew,
    new Lexeme.fromString('circle'): Circle.createNew,
    new Lexeme.fromString('rectangle'): Rectangle.createNew
  };
}

class Lexeme {
  final String _lexeme;

  Lexeme._(this._lexeme);

  factory Lexeme.fromString(String lexeme) {
    return new Lexeme._(lexeme.trim());
  }

  bool operator ==(Object other) => other is Lexeme && _lexeme == other._lexeme;

  int get hashCode => _lexeme.hashCode * 17;

  int asInt() => int.parse(_lexeme);

  String asString() => _lexeme;
}