part of shapes;

class Rectangle implements Shape {
  final num _x, _y;

  Rectangle(this._x, this._y);

  num get area => _x * _y;
  num get circumference => 2 * _x * _y;
  String toString() => 'Rectangle($_x, $_y)';

}
