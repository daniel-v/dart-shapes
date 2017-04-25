class ShapePredicate {
  String operand1;
  String operand2;
  String op;

  static ShapePredicate createFromString(String shapePredicate) {
    var trimmedPredicate = shapePredicate.trim();
    if (trimmedPredicate.isEmpty) return null;

    var predicateParts = trimmedPredicate.split(' ');
    if (predicateParts.length != 3) return null;

    var result = new ShapePredicate();
    result.operand1 = predicateParts[0];
    result.op = predicateParts[1];
    result.operand2 = predicateParts[2];

    return result;
  }

  String toString() => '$operand1 $op $operand2';
}
