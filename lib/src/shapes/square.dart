part of shapes;

class Square implements Shape {
  final num _x;

  Square(this._x);

  num get area => _x * _x;
  num get circumference => 4 * _x;
  String toString() => 'Square($_x)';
}
