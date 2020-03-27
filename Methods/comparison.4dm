//%attributes = {}
C_BOOLEAN:C305($equal)
C_LONGINT:C283($count;$i;$j)
C_TEXT:C284($t1;$t2)
C_COLLECTION:C1488($c)

$t1:="Hello world"
$t2:=Uppercase:C13($t1)

$count:=1000000

$c:=New collection:C1472
$c.push(Milliseconds:C459)

For ($i;1;$count;1)
	
	$equal:=(Length:C16($t1)=Length:C16($t2))
	
	If ($equal)
		
		  //%R-
		For ($j;1;Length:C16($t1);1)
			
			$equal:=$equal & (Character code:C91($t1[[$j]])=Character code:C91($t2[[$j]]))
			
		End for 
		
		  //%R+
		
	End if 
End for 

$c[$c.length-1]:=Milliseconds:C459-$c[$c.length-1]

$c.push(Milliseconds:C459)

For ($i;1;$count;1)
	
	$equal:=(Length:C16($t1)=Length:C16($t2)) & (Position:C15($t1;$t2;1;*)=1)
	
End for 

$c[$c.length-1]:=Milliseconds:C459-$c[$c.length-1]

$c.push(Milliseconds:C459)

For ($i;1;$count;1)
	
	$equal:=Match regex:C1019("(?m-si)^"+$t1+"$";$t2;1)
	
End for 

$c[$c.length-1]:=Milliseconds:C459-$c[$c.length-1]

$c.push(Milliseconds:C459)

For ($i;1;$count;1)
	
	$equal:=OB Is defined:C1231(New object:C1471(\
		$t1;1);\
		$t2)
	
End for 

$c[$c.length-1]:=Milliseconds:C459-$c[$c.length-1]

$c.push(Milliseconds:C459)

For ($i;1;$count;1)
	
	$equal:=New collection:C1472($t1).equal(New collection:C1472($t2);ck diacritical:K85:3)
	
End for 

$c[$c.length-1]:=Milliseconds:C459-$c[$c.length-1]

ALERT:C41($c.join("\r"))