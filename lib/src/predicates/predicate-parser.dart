part of predicates;

class PredicateParser implements LineParser<Predicate> {

  Predicate parse(String line) {
    return new Predicate.createFromString(line);
  }

}