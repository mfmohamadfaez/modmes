import 'package:modmes/knowledge-based.dart';

class WorkingMemory {
  List newFacts = new List();

  void addFact(String fact) {
    this.newFacts.add(fact);
  }

  List get facts {
    return this.newFacts;
  }
}
