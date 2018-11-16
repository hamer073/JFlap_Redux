# JFlap_Redux
An attempt at rebuilding the JFlap formal language tool

One of the big goals with this project is to improve on how JFlap handles NFA's.
Ideally, want to convert an NFA to a DFA when testing input so that there aren't issues with the program generating hundreds of thousands of possible ways to pass through the NFA before deciding if it accepts or rejects.
