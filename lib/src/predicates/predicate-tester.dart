part of predicates;

class PredicateTester {

  static bool evaluate(num operand1, num operand2, String op) {
    bool result;
    switch (op) {
      case '<':
        result = operand1 < operand2;
        break;
      case '<=':
        result = operand1 <= operand2;
        break;
      case '>':
        result = operand1 > operand2;
        break;
      case '>=':
        result = operand1 >= operand2;
        break;
      case '=': // Intentional fall-through
      case '==':
        result = operand1 == operand2;
        break;
      case '!=':
        result = operand1 != operand2;
        break;
      default:
        throw new Exception('Predicates.evaluate(): Unimplemented operand $op');
    }
    return result;
  }

  static num decode(Shape shape, String operand) {
    InstanceMirror im = reflect(shape);
    try {
      return im.getField(new Symbol(operand)).reflectee;
    } catch (e) {
      return null;
    }
  }

  static bool test(Shape shape, Predicate predicate) {
    num numOp1 = num.parse(predicate.operand1, (strOp) => decode(shape, strOp));
    num numOp2 = num.parse(predicate.operand2, (strOp) => decode(shape, strOp));
    return evaluate(numOp1, numOp2, predicate.op);
  }
}
