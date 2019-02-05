# JFlap_Redux
An attempt at rebuilding the JFlap formal language tool

# Libraries and Frameworks
This project is going to mainly use the Java Processing library for dealing with the graphical side along with some Java Swing for things like text input boxes and most likely context menus in the future.
You can find the processing editor and documentation at https://processing.org/. It's highly recommended to use the editor when working with processing files as there's not (as far as I know) an easy way to run the source code otherwise.

# Goals
One of the big goals with this project is to improve on how JFlap handles NFA's.
Ideally, want to convert an NFA to a DFA when testing input so that there aren't issues with the program generating hundreds of thousands of possible ways to pass through the NFA before deciding if it accepts or rejects.
Would still want to have some sort of step through functionality that leaves the NFA as is

# Usage
When you start up the program it will default to the state mode. This mode lets you create states by left clicking and move states by clicking and dragging a state. The first state that you create will automatically be set to be the initial state. Right clicking on a state will toggle it between a final/accept and not final/accept state.
To switch modes press the m key.
The other mode is for creating a transition. To create a transition click and drag on one state to another in the transition state. You'll be prompted to enter a string to be the transition symbol. For now this must only be one character (the input box will not limit you) because when you run on an input the program will only look at one character at a time.
To test an input press the r key and enter an input string. For now, the result of the run will be printed out to the console.

# Todo
Add better styling to the window
* Have a better indicator of which state is the start states
* Have a better indicator of which state(s) are end states
* Have some indication of which direction a transition is going
* Likely use a different background color than just black with white states

# Known Bugs
None at the moment!
