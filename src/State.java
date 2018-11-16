public class State {

  private String name;
  private Map<String, State> transitions;

  public State(String name) {
    this.name = name;
  }

  public State transition(String variable) {
    return transitions.get(variable);
  }

  public void addTransition(String variable, State state) {
    transitions.put(variable, state);
  }

  public void removerTransition(String variable) {
    transitions.remove(variable);
  }

  public String getName(){
    return this.name;
  }
}
