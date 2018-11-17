public class DFAState {

  private String name;
  private Map<String, DFAState> transitions;

  public DFAState(String name) {
    this.name = name;
  }

  public DFAState transition(String variable) {
    return transitions.get(variable);
  }

  public void addTransition(String variable, DFAState state) {
    transitions.put(variable, state);
  }

  public void removerTransition(String variable) {
    transitions.remove(variable);
  }

  public String getName(){
    return this.name;
  }
}
