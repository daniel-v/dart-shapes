import 'package:args/args.dart';
import 'package:dart_shapes/file-parser.dart';
import 'package:dart_shapes/shapes-mirror.dart';
import 'package:dart_shapes/predicates.dart';

main(List<String> arguments) async {
  ArgResults argResults;
  final defaultInput = 'lib/assets/input.txt';
  final defaultPredicates = 'lib/assets/predicates.txt';
  final parser = new ArgParser()
    ..addOption('input', abbr: 'i')
    ..addOption('predicates', abbr: 'p');

  argResults = parser.parse(arguments);

  ShapesMirror mirror = new ShapesMirror();
  mirror.buildMirrors();

  String inputPath =
      argResults['input'] == null ? defaultInput : argResults['input'];
  FileParser inputParser = new FileParser(inputPath, mirror);

  try {
    await inputParser.parse();
  } on NoSuchMethodError catch (e) {
    print('***Error: don\'t know how to create object ' + e.toString());
  } on FormatException catch (e) {
    print('***Error: couldn\'t parse numeric arguments ' + e.toString());
  }

  Predicates predicates = new Predicates();
  String predicatesPath = argResults['predicates'] == null
      ? defaultPredicates
      : argResults['predicates'];
  FileParser predicateParser = new FileParser(predicatesPath, predicates);

  try {
    await predicateParser.parse();
  } catch (e) {
    print(e.toString());
  }

  for (var predicate in predicates.predicates) {
    print('Evaluation of "$predicate" is true for');
    bool hasOne = false;
    for (var shape in mirror.shapes) {
      if (predicates.test(shape, predicate)) {
        hasOne = true;
        print('\t $shape');
      }
    }
    if (!hasOne) {
      print('\t None of the shapes satisfy this predicate');
    }
  }
}
