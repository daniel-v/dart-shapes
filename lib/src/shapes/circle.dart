part of shapes;

class Circle implements Shape<Circle> {
  final num _r;

  Circle(this._r);

  factory Circle.fromLexemes(Iterable<Lexeme> lexemes) {
    return new Circle(lexemes.elementAt(1).asInt());
  }

  num get area => _r * _r * PI;

  num get circumference => 2 * _r * PI;

  String toString() => 'Circle($_r)';

  static Circle createNew(Iterable<Lexeme> lexemes) => new Circle.fromLexemes(lexemes);
}
