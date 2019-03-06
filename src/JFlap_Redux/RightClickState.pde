import javax.swing.*;
import java.awt.event.*;

class RightClickState extends JPopupMenu {
  DFAState state;
  DFAState startState;
  
  public RightClickState(DFAState state, DFAState startState) {
    this.state = state;
    this.startState = startState;
    
    JMenuItem toggleInitial = new JMenuItem("Toggle Initial State");
    toggleInitial.addActionListener(new ToggleInitialActionListener(this.state, this.startState));
    
    JMenuItem toggleFinal = new JMenuItem("Toggle Final Status");
    toggleFinal.addActionListener(new ToggleFinalActionListener(this.state, this));
    
    add(toggleInitial);
    add(toggleFinal);
  }
  
  private class ToggleInitialActionListener implements ActionListener {
    DFAState state;
    DFAState startState;
    
    public ToggleInitialActionListener(DFAState state, DFAState startState) {
      this.state = state;
      this.startState = startState;
    }
    
    public void actionPerformed(ActionEvent e) {
      System.out.println("Selected: " + e.getActionCommand());
      this.startState = state;
      
    }
    
  }
  
  private class ToggleFinalActionListener implements ActionListener {
    RightClickState menu;
    DFAState state;
    
    public ToggleFinalActionListener(DFAState state, RightClickState menu) {
      this.state = state;
      this.menu = menu;
    }
    
    public void actionPerformed(ActionEvent e) {
      System.out.println("Selected: " + e.getActionCommand());
      this.state.flipFinal();
      menu.setVisible(false);
    }
  }
  
}
