part of shapes;

class ShapeParser implements LineParser<Shape> {
  ShapesMirror mirror;

  ShapeParser() {
    mirror = new ShapesMirror();
    mirror.buildMirrors();
  }

  Shape parse(String line) {
    return mirror.reflect(line);
  }
}
