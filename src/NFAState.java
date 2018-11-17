
public class NFAState {
  private String name;
  private Map<String, Set<NFAState>> transitions;

  public NFAState(String name) {
    this.name = name;
  }

  public NFAState transition(String variable) {
    return transitions.get(variable);
  }

  public void addTransition(String variable, NFAState state) {
    if(transitions.get(variable) == null) {
      transitions.put(variable, new Set().add(state));
    } else {
      transitions.get(variable).add(state);
    }
  }

  public void removeTransition(String variable, NFAState state) {
    if(transitions.get(variable).size() == 1) {
      transitions.remove(variable);
    } else {
      transitions.get(variable).remove(state);
    }
  }

}
