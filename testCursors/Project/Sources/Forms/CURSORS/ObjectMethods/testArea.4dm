var $e : Object

$e:=FORM Event:C1606

If ($e.code=On Mouse Enter:K2:33)\
 | ($e.code=On Mouse Move:K2:35)
	
	SET CURSOR:C469(Num:C11(Form:C1466.cursor))
	
Else 
	
	SET CURSOR:C469
	
End if 