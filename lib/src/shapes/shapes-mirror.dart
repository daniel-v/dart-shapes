part of shapes;

class ShapesMirror {
  var _classMirrors = new Map<Symbol, ClassMirror>();
  var _symbolCache = new Map<String, Symbol>();
  final _emptySymbol = new Symbol('');
  final log = new Logger('ShapesMirror');

  buildMirrors() {
    MirrorSystem mirrors = currentMirrorSystem();
    Map<Symbol, DeclarationMirror> declarations =
        mirrors.findLibrary(#shapes).declarations;

    ClassMirror shapeInterface = declarations[#Shape];
    declarations.forEach((key, mirror) {
      if (mirror is ClassMirror &&
          !mirror.isAbstract &&
          mirror.superinterfaces.contains(shapeInterface)) {
        _classMirrors[key] = mirror;
      }
    });
  }

  Shape reflect(String shapeDefinition) {
    var trimmedDefinition = shapeDefinition.trim();
    if (trimmedDefinition.isEmpty) return null;

    var arguments = trimmedDefinition.split(' ');
    var className = arguments.removeAt(0);
    className = className.substring(0, 1).toUpperCase() +
        className.substring(1).toLowerCase();

    try {
      // A bit of simplification -- assume that all shape constructors take only numeric arguments
      List<num> numericArgs =
          arguments.map((argument) => num.parse(argument)).toList();
      if (!_symbolCache.containsKey(className)) {
        _symbolCache[className] = new Symbol(className);
      }
      Shape shape = _classMirrors[_symbolCache[className]]
          .newInstance(_emptySymbol, numericArgs)
          .reflectee;
      return shape;
    } on NoSuchMethodError catch(e) {
      log.severe('Error: Don\'t know how to create "$shapeDefinition"', e);
      return null;
    } on FormatException catch(e) {
      log.severe('Error: Unable to convert $className arguments $arguments to numeric values', e);
      return null;
    }
  }
}
