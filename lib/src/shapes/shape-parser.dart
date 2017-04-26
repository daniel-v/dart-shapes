part of shapes;

class ShapeParser implements LineParser {
  ShapesMirror mirror;

  ShapeParser() {
    mirror = new ShapesMirror();
    mirror.buildMirrors();
  }

  parse(String line) {
    return mirror.reflect(line);
  }
}
