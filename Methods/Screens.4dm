//%attributes = {}
var $group; $t : Text
var $offScreen : Boolean
var $bottom; $color; $depth; $height; $i; $left : Integer
var $maxBottom; $maxRight; $midHeight; $minLeft; $minTop; $right : Integer
var $screen; $top; $width : Integer
var $colors : Collection
var $svg : cs:C1710.svg

$colors:=New collection:C1472
$colors[0]:="Black and white"
$colors[2]:="Four colors"
$colors[4]:="Sixteen colors"
$colors[8]:="Two fifty six colors"
$colors[16]:="Thousands of colors"
$colors[24]:="Millions of colors 24 bit"
$colors[32]:="Millions of colors 32 bit"

$svg:=cs:C1710.svg.new()\
.translate(20; 20)\
.scale(0.25)\
.fontFamily("sans-serif")\
.fontSize(36)

// Mark:-Screens
For ($screen; 1; Count screens:C437; 1)
	
	SCREEN COORDINATES:C438($left; $top; $right; $bottom; $screen)
	
	$minLeft:=$left<$minLeft ? $left : $minLeft
	$minTop:=$top<$minTop ? $top : $minTop
	$maxRight:=$right>$maxRight ? $right : $maxRight
	$maxBottom:=$bottom>$maxBottom ? $bottom : $maxBottom
	
	$width:=$right-$left
	$height:=$bottom-$top
	
	$group:="screen_"+String:C10($screen)
	$svg.group($group; "root")\
		.alignment(Align center:K42:3)
	
	$svg.rect($width; $height; $group)\
		.position($left; $top)\
		.fillColor("white")\
		.strokeColor("blue")
	
	If ($screen=Menu bar screen:C441)
		
		// Mark:Menu bar
		$svg.rect($width; 58; $group)\
			.position($left; $top)\
			.color("lightgrey")\
			.fillOpacity(0.2)
		
		If (Is macOS:C1572)
			
			$svg.text(Char:C90(0xF8FF); $group)\
				.position(10; 48)\
				.fontSize(48)\
				.alignment(Align left:K42:2)
			
			$svg.textArea(""; $group)\
				.position(70; 8)\
				.fontStyle(Bold:K14:2)\
				.push("menu")
			
		Else 
			
			$svg.textArea("")\
				.position(10; 8)\
				.fontStyle(Bold:K14:2)\
				.push("menu")
			
		End if 
		
		$svg.setText(New collection:C1472("4D"; "File"; "Edit"; "Run"; "Design"; "Records"; "Tools"; "Method"; "Window"; "Help").join(Char:C90(160)*2); "menu")
		
		// Mark:Toolbar
		If (Tool bar height:C1016>0)
			
			$svg.rect($width; Tool bar height:C1016; $group)\
				.position($left; $top+58)\
				.color("silver")\
				.fillOpacity(0.5)
			
		End if 
	End if 
	
	$midHeight:=$top+($height/2)
	
	$svg.text(String:C10($screen); $group)\
		.position($left+($width/2)-48; $midHeight-256)\
		.fontSize(96*2)\
		.color("blue")\
		.fontStyle(Bold:K14:2)
	
	$svg.text("Resolution: "+String:C10($width)+" x "+String:C10($height); $group)\
		.position($left+($width/2)-48; $midHeight-80)\
		.fontSize(72)\
		.color("black")
	
	$svg.text("left "+String:C10($left)+", top "+String:C10($top)+", right "+String:C10($right)+", bottom "+String:C10($bottom); $group)\
		.position($left+($width/2)-48; $midHeight+70)\
		.fontSize(48)\
		.fontStyle(Italic:K14:3)
	
	SCREEN DEPTH:C439($depth; $color; $screen)
	
	$svg.text((Bool:C1537($color) ? "" : "Gray scale")+$colors[$depth]; $group)\
		.position($left+($width/2)-48; $midHeight)\
		.fontSize(48)
	
End for 

// Mark:-Windows
ARRAY LONGINT:C221($windows; 0x0000)
WINDOW LIST:C442($windows)

$group:="windows"
$svg.group($group; "root")\
.color("skyblue")\
.fillOpacity(0.1)\
.alignment(Align center:K42:3)

$t:=File:C1566(Structure file:C489(*); fk platform path:K87:2).name+" - "

For ($i; 1; Size of array:C274($windows); 1)
	
	GET WINDOW RECT:C443($left; $top; $right; $bottom; $windows{$i})
	
	$width:=$right-$left
	$height:=$bottom-$top
	
	$offScreen:=($right<=0) || ($bottom<=0) || ($top>=$maxBottom) || ($left>=$maxRight)
	
	$svg.rect($width; $height; $group)\
		.position($left; $top)
	
	If ($offScreen)
		
		$svg.color("red")
		
		$svg.text(String:C10($windows{$i}); $group)\
			.position($left+($width/2); $top+100)\
			.fillOpacity(1)\
			.color("red")
		
	End if 
	
	$svg.rect($width; 55; $group)\
		.position($left; $top)
	
	$svg.text(Replace string:C233(Get window title:C450($windows{$i}); $t; ""); $group)\
		.position($left+($width/2); $top+40)\
		.color($offScreen ? "red" : "blue")\
		.fillOpacity(1)
	
End for 

$svg.viewbox($minLeft; $minTop; $maxRight-$minLeft; $maxBottom-$minTop)
$svg.translate((Abs:C99($minLeft)+20)*0.25; (Abs:C99($minTop)+20)*0.25; "root")

$svg.preview()