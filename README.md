# PSJRS-Processing-Visuals
Visuals programmed using the Processing graphical library for a band live show

## Dependencies
Minim sound library which can be installed inside of the Processing IDE.

## How to run
Just press play. You can switch the current visual with the mouse scroll wheel. Some visuals are affected by sound, the position of the mouse and/or the click of the mouse. The LTree Visual requires that the LTree.txt file be present in the folder where you installed processing since this is the runDir.

## How to add new visuals
The PSJRS file contains the main setup and draw methods. This class also contains one instance of each visual. If you wanna add a new visualization, you must create a class that inherits from the Visual class and implement its methods. After that, add an instance to the PSJRS class and add it to the  switch inside the mouseWheel method. Also, increment the totalVis variable.
