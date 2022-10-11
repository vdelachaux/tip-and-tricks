# Have you ever lost a window?

Sometimes, when changing the screen environment, it happens that a window is opened off screen. 

<a href="/Methods/screens.4dm">This method</a> which uses the class [svg](https://github.com/vdelachaux/SVG-with-Classes) should help you to find it.


You will get something like this:

 <img src="Have you ever lost a window.png" width="1000"/>

And if a window is off screen, it is drawn in red and indicates its reference number to use with the command [**SET WINDOW RECT**](https://doc.4d.com/4Dv19/4D/19.4/SET-WINDOW-RECT.301-6023666.en.html) to put it back on the screen.
