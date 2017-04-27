part of shapes;

abstract class Shape<T extends Shape<T>> {
  num get area;
  num get circumference;

  @override
  String toString();
}
