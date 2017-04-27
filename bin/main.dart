import 'package:args/args.dart';
import 'package:logging/logging.dart';
import 'package:dart_shapes/file-parser.dart';
import 'package:dart_shapes/predicates.dart';
import 'package:dart_shapes/shapes.dart';

main(List<String> arguments) async {
  Iterable<Shape> shapes;
  Iterable<Predicate> predicates;
  Map<String, String> params = parseParams(arguments);

  Logger log = initLogger();

  var inputParser = new FileParser<Shape>(params['input'], new ShapeParser());
  var predicateParser = new FileParser<Predicate>(params['predicates'], new PredicateParser());

  try {
    shapes = inputParser.parse();
  } catch (_) {
    log.severe('Unable to read input file ${params["input"]}. Exiting');
    return 1;
  }

  try {
    predicates = predicateParser.parse();
  } catch (_) {
    log.severe('Unable to read predicates file ${params["predicates"]}. Exiting');
    return 1;
  }

  printResults(shapes, predicates);
}

Map<String, String> parseParams(List<String> arguments) {
  ArgResults argResults;
  var params = new Map<String, String>();
  final defaultInput = 'lib/assets/input.txt';
  final defaultPredicates = 'lib/assets/predicates.txt';
  final parser = new ArgParser()
    ..addOption('input', abbr: 'i')
    ..addOption('predicates', abbr: 'p');

  argResults = parser.parse(arguments);
  String inputPath =
      argResults['input'] == null ? defaultInput : argResults['input'];
  String predicatesPath = argResults['predicates'] == null
      ? defaultPredicates
      : argResults['predicates'];

  params['input'] = inputPath;
  params['predicates'] = predicatesPath;

  return params;
}

Logger initLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
  return new Logger('main');
}

void printResults(Iterable<Shape> shapes, Iterable<Predicate> predicates) {
  for (var predicate in predicates) {
    print('Evaluation of "$predicate" is true for');
    bool hasOne = false;
    for (var shape in shapes) {
      if (PredicateTester.test(shape, predicate)) {
        hasOne = true;
        print('\t $shape');
      }
    }
    if (!hasOne) {
      print('\t None of the shapes satisfy this predicate');
    }
  }
}
