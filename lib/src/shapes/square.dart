part of shapes;

class Square implements Shape<Square> {
  final num _x;

  factory Square.fromLexemes(Iterable<Lexeme> lexemes) {
    return new Square(lexemes.elementAt(1).asInt());
  }

  Square(this._x);

  num get area => _x * _x;

  num get circumference => 4 * _x;

  String toString() => 'Square($_x)';

  static Square createNew(Iterable<Lexeme> lexemes) => new Square.fromLexemes(lexemes);
}
