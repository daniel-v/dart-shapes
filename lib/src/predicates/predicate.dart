part of predicates;

class Predicate {
  String operand1;
  String operand2;
  String op;
  static final log = new Logger('Predicate');

  static Predicate createFromString(String predicateStr) {
    var trimmedPredicate = predicateStr.trim();
    if (trimmedPredicate.isEmpty) {
      log.warning('Received empty line as predicate string');
      return null;
    }

    var predicateParts = trimmedPredicate.split(' ');
    if (predicateParts.length != 3) {
      log.severe('A predicate should contain 3 parts (2 operands and 1 operator), found ${predicateParts.length} parts in "$predicateStr"');
      return null;
    } 

    var result = new Predicate();
    result.operand1 = predicateParts[0];
    result.op = predicateParts[1];
    result.operand2 = predicateParts[2];

    return result;
  }

  String toString() => '$operand1 $op $operand2';
}
