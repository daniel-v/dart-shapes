part of predicates;

class PredicateParser implements LineParser {

  Predicate parse(String line) {
    return Predicate.createFromString(line);
  }

}