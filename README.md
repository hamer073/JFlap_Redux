# JFlap_Redux
An attempt at rebuilding the JFlap formal language tool

# Libraries and Frameworks
This project is going to mainly use the Java Processing library for dealing with the graphical side along with some Java Swing for things like text input boxes and most likely context menus in the future.
You can find the processing editor and documentation at https://processing.org/. It's highly recommended to use the editor when working with processing files as there's not (as far as I know) an easy way to run the source code otherwise.

# Goals
One of the big goals with this project is to improve on how JFlap handles NFA's.
Ideally, want to convert an NFA to a DFA when testing input so that there aren't issues with the program generating hundreds of thousands of possible ways to pass through the NFA before deciding if it accepts or rejects.
Would still want to have some sort of step through functionality that leaves the NFA as is
