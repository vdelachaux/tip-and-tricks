# How to synchronous play a sound file on macOS?

on macOS, the command **[PLAY](https://doc.4d.com/4Dv19/4D/19.4/PLAY.301-6022871.en.html)** always play asynchronously.

If you want to play a sound synchronously, you must call ***afplay*** with **LAUNCH EXTERNAL PROCESS**

```4d
var $cmd; $err; $fileName; $in; $out : Text

$fileName:=Select document(""; ".mp3"; ""; 0)

If (OK=1)
	
	$cmd:="/bin/sh"
	$in:="afplay "+File(Document; fk platform path).path
	LAUNCH EXTERNAL PROCESS($cmd; $in; $out; $err)
	
End if 
```

## 19R5+

Take a look at [the use of SystemWorkers](https://github.com/vdelachaux/player) with ***afplay*** to manage a playlist
