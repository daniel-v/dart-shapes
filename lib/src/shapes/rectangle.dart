part of shapes;

class Rectangle implements Shape<Rectangle> {
  final num _x, _y;

  Rectangle(this._x, this._y);

  factory Rectangle.fromLexemes(Iterable<Lexeme> lexemes) {
    return new Rectangle(lexemes.elementAt(1).asInt(), lexemes.elementAt(2).asInt());
  }

  num get area => _x * _y;

  num get circumference => 2 * (_x + _y);

  String toString() => 'Rectangle($_x, $_y)';

  static Rectangle createNew(Iterable<Lexeme> lexemes) => new Rectangle.fromLexemes(lexemes);

}
