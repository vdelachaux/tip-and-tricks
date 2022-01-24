
[256]: cursors/ibeam@2x.png
[260]: cursors/beachball@2x.png
[355]: cursors/pointer@2x.png
[552]: cursors/cross@2x.png
[559]: cursors/zoomout@2x.png
[560]: cursors/zoomin@2x.png
[9000]: cursors/pointinghand@2x.png
[9001]: cursors/move@2x.png
[9003]: cursors/resizeeastwest@2x.png
[9004]: cursors/resizenorthsouth@2x.png
[9005]: cursors/resizenorthwestsoutheast@2x.png
[9006]: cursors/resizenortheastsouthwest@2x.png
[9009]: cursors/resizeupdown@2x.png
[9010]: cursors/verticalSplit@2x.png
[9011]: cursors/horizontalSplit@2x.png
[9013]: cursors/openhand@2x.png
[9014]: cursors/closedhand@2x.png
[9015]: cursors/contextualmenu@2x.png
[9016]: cursors/copy@2x.png
[9017]: cursors/makealias@2x.png
[9018]: cursors/help@2x.png
[9019]: cursors/notallowed@2x.png
[9020]: cursors/pointerToRight@2x.png
[9021]: cursors/resizeleftright@2x.png

# Don't forget the cursor

The cursor displayed on the screen gives contextual information to the user about a possible or current action. This is why this interface element should not be overlooked. 

You might use this technique to provide visual feedback about what actions the user can take with the mouse. For example, you might display one of the resize cursors whenever the mouse moves over a portion of your view that acts as a custom resizing handle. To set this up, you'll use the command <a href="https://doc.4d.com/4Dv19/4D/19.1/SET-CURSOR.301-5652895.en.html" >SET CURSOR</a> that allow to change the displayed cursor.

> 📌 As the effect of this command can be cancelled at any time by a system request for a display update, it is recommended to use it during the On mouse move event. And conversely, if there is no request for a redraw, the cursor may not be reset. 
> 
> So, the best practice is to set the cursor at the _On Mouse Enter_ and _On Mouse Move events_, and to remember to restore the standard mouse cursor at the _On Mouse Leave event_. Like this for example:

```4D
$e:=FORM EventIf ($e.code=On Mouse Enter)\	 | ($e.code=On Mouse Move)		SET CURSOR($id)	Else 		SET CURSOR	End if 
```

The following table shows and describes the avalaible system cursors and indicates the id to pass in the cursor parameter.

**Note**: Cursor availability and appearance may vary depending on the operating system.

## The cursors

|      macOS           |       | 4D ID |  Name  |
|:--------------------:|:------|:-----:|:------|
|![Alt Image Text][9000]| The pointing-hand cursor | 9000 | pointingHandCursor | 
|![Alt Image Text][9013]| The open-hand cursor | 9013 | openHandCursor | 
|![Alt Image Text][9014]| The closed-hand cursor | 9014 | closedHandCursor | 
|![Alt Image Text][9015]| The contextual menu cursor | 9015 | contextualMenuCursor | 
|![Alt Image Text][9016]| The drag copy cursor | 9016 | dragCopyCursor| 
|![Alt Image Text][9019]| The not allowed cursor | 9019 | notAllowedCursor| 
|![Alt Image Text][256]| The I-beam cursor for indicating insertion points| 1 | IBeamCursor |
|![Alt Image Text][355]| The arrow cursor | 355| pointerCursor  |
|![Alt Image Text][9020]| The arrow oriented to right cursor | 355| pointerToRightCursor  |
|![Alt Image Text][552]| The cross-hair cursor | 2 | crosshairCursor |
|![Alt Image Text][9017]| The drag link cursor | 9017  | dragLinkCursor |
|![Alt Image Text][9018]| The help cursor | 9018 | helpCursor |
|![Alt Image Text][559]| The zoom out cursor | 559 | zoomOutCursor |
|![Alt Image Text][560]| The zoom in cursor | 560 | zoomInCursor |
|![Alt Image Text][9001]| The move cursor| 9001 | moveCursor
|![Alt Image Text][9003]| The horizontal resize cursor | 9003 | horizontalResizeCursor |
|![Alt Image Text][9004]| The vertical resize cursor | 9004 | verticalResizeCursor |
|![Alt Image Text][9005]| The resize top-left-bottom-right cursor | 9005  | resizeNorthWestSouthEastCursor |
|![Alt Image Text][9006]| The resize bottom-left-top-right cursor | 9006  | resizeNorthEastSouthWestCursor |
|![Alt Image Text][9021]| The resize-left-and-right cursor | 9021  | resizeleftrightCursor |
|![Alt Image Text][9009]| The resize-up-and-down cursor | 9009  | resizeUpDownCursor |
|![Alt Image Text][9010]| The vertical split cursor | 9010  | verticalSplitCursor |
|![Alt Image Text][9011]| The horizontal split cursor | 9011  | horizontalSplitCursor |
