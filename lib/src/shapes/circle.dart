part of shapes;

class Circle implements Shape {
  final num _r;

  Circle(this._r);

  num get area => _r * _r * PI;
  num get circumference => 2 * _r * PI;
  String toString() => 'Circle($_r)';
}
