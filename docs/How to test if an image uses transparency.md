# How to test if an image uses transparency?

Have you ever wanted to know if an image uses transparency?
This method should give you the answer:

```4d
#DECLARE($image : Picture) : Booleanvar $code; $root : Textvar $white; $mask; $result : Picturevar $height; $width : Integer// Create a white picture with the same width and height as the image to be tested.PICTURE PROPERTIES($image; $width; $height)$code:="<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>"$code+="<svg xmlns='http://www.w3.org/2000/svg' viewport-fill='white' viewport-fill-opacity='1' width='<!--#4DEVAL $1-->' height='<!--#4DEVAL $2-->'/>"PROCESS 4D TAGS($code; $code; $width; $height)$root:=DOM Parse XML variable($code)SVG EXPORT TO PICTURE($root; $white; Get XML data source)DOM CLOSE XML($root)// Combine the white image with the image to be testedCOMBINE PICTURES($result; $white; Superimposition; $image)return Not(Equal pictures($result; $image; $mask))
```
