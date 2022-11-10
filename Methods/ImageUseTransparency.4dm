//%attributes = {"invisible":true,"preemptive":"capable"}
// ----------------------------------------------------
// Project method : pic_isTransparent
// ID[5293AD24049A4DA6BBC347722ED599E5]
// Created 23-5-2017 by Vincent de Lachaux
// ----------------------------------------------------
// Description:
// Return true if the passed picture use transparency
// ----------------------------------------------------
#DECLARE($image : Picture) : Boolean

If (False:C215)
	C_PICTURE:C286(pic_isTransparent; $1)
	C_BOOLEAN:C305(pic_isTransparent; $0)
End if 

var $code; $root : Text
var $white; $mask; $result : Picture
var $height; $width : Integer

// Create a white picture with the same width and height as the image to be tested.
PICTURE PROPERTIES:C457($image; $width; $height)
$code:="<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>"
$code+="<svg xmlns='http://www.w3.org/2000/svg' height='<!--#4DEVAL $1-->' viewport-fill='white' viewport-fill-opacity='1' width='<!--#4DEVAL $2-->'/>"
PROCESS 4D TAGS:C816($code; $code; $height; $width)
$root:=DOM Parse XML variable:C720($code)
SVG EXPORT TO PICTURE:C1017($root; $white; Get XML data source:K45:16)
DOM CLOSE XML:C722($root)

// Combine the white image with the image to be tested
COMBINE PICTURES:C987($result; $white; Superimposition:K61:10; $image)

return Not:C34(Equal pictures:C1196($result; $image; $mask))