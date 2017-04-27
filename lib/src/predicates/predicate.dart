part of predicates;

class Predicate {
  final String operand1;
  final String operand2;
  final String op;

  Predicate._(this.operand1, this.operand2, this.op);

  factory Predicate.createFromString(String predicateStr) {
    var trimmedPredicate = predicateStr.trim();
    if (trimmedPredicate.isEmpty) {
      log.warning('Received empty line as predicate string');
      return null;
    }

    var predicateParts = trimmedPredicate.split(' ');
    if (predicateParts.length != 3) {
      log.severe('A predicate should contain 3 parts (2 operands and 1 operator), found ${predicateParts
          .length} parts in "$predicateStr"');
      return null;
    }

    var result = new Predicate._(
        predicateParts[0],
        predicateParts[2],
        predicateParts[1]
    );

    return result;
  }

  String toString() => '$operand1 $op $operand2';

  static final log = new Logger('Predicate');
}
