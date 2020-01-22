import 'package:modmes/knowledge-based.dart';
import 'package:modmes/working_memory.dart';

class InferenceEngine {
  bool condition = false;

  List getConclusion(KnowledgeBase kb, WorkingMemory wm) {
    String conclusion = "";
    int count = 0;
    List usedRule = new List();
    List nFacts = wm.facts;
    List newFacts = new List();
    List rules = kb.getRules();
    condition = false;

    for (List rule in rules) {
      count++;
//      for(String fact in rule){
      for (int i = 1; i < rule.length - 1; i++) {
        if (nFacts.contains(rule[i])) {
          condition = true;
        } else {
          condition = false;
          break;
        }
      }
      if (condition) {
        newFacts.add(rule.last);
        conclusion = rule.last;
        usedRule.add(conclusion);
        usedRule.add(count);
        break;
      } else
        conclusion = "no conclusion";
    }

    if (newFacts.length > 0) {
      count = 0;
      for (List rule in rules) {
        count++;
//      for(String fact in rule){
        for (int i = 0; i < rule.length - 1; i++) {
          if (newFacts.contains(rule[i])) {
            condition = true;
          } else {
            condition = false;
            break;
          }
        }
        if (condition) {
          usedRule.add(count);
          usedRule[0] = rule.last;
          break;
        }
      }
    }

    return usedRule;
  }
}
