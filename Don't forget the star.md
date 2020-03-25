# Don't forget the star

Many 4D commands use the char `*` as parameter.


1. The most common use is to use a widget name instead of a variable reference into a form.

	> If you pass the optional * parameter, this indicates that the object parameter is an object name (a character string). If you do not pass the * parameter, this indicates that object is a field or a variable. In this case, do not pass a string but rather a field or variable reference (object type only).
	
	In this case the star is the first parameter of the commands.


2. For some commands to manage the hierarchical list, the * is used instead of the element reference to work with the currently selected element.

3. In other cases, the star is used as a comportement modifier of the command.  
   In this case, the star is a last optional parameter.

	Here is some samples:
	
	|COMMANDS     |MODIFIER MEANING|
	|-------------|----------------|
	|**Uppercase**<br>**Lowercase**|Preserve accented characters|
	|**Position**<br>**Replace string**|Case sensitive|
	|**GET TEXT KEYWORDS**<br>**GET PICTURE KEYWORDS**|Only different keyword|
	|**Match regex**|Only searches at position indicated|
	|**File**<br>**Folder**<br>**Get 4D folder**<br>**Get 4D file**<br>**Structure file**|Return pathname of host database|
	|**Get database localization**<br>**Is compiled mode**|Return information about host database|
	|**SET DATABASE LOCALIZATION**|Only apply to the database where the code is executed|
	|**Current date**<br>**Current time**|Return value from the server|
	|**FORM Get current page**<br>**FORM GOTO PAGE**|Applies to the subform|
	|**FORM LOAD**|Applies to host database when it is executed from a component|
	|**FORM SET INPUT**|Automatic window size|
	|**FORM SET SIZE**|See documentation|
	|**CLEAR LIST**<br>**DELETE FROM LIST**|Clear the sublists too|
	|**Count list items**|All items in the list (not just the visible ones)|
	|**Find in list**<br>**Selected list items**|Use reference number|
	|**HTTP AUTHENTICATE**|Authentication by proxy|
	|**HTTP Get**<br>**HTTP Request**|Enables the keep-alive mechanism|
	|**EXPORT DATA**<br>**IMPORT DATA**|Displays the import dialog box and updates the project|
	|**SET ASSERT ENABLED**|Applies to current process only|
	|**JSON Parse**|Adds line position and offset of each property|
	|**JSON Stringify**<br>**JSON Stringify array**|Pretty formatting|
	|**APPEND MENU ITEM**<br>**INSERT MENU ITEM**<br>**SET MENU ITEM**|Consider metacharacters as standard characters|
	|**SET MENU BAR**|Save menu bar state|
	|**OBJECT DUPLICATE**<br>**OBJECT MOVE**|Absolute coordinates|
	|**OBJECT SET SCROLL POSITION**|Display of line (and column if any) in first position after scroll|
	|**SET FILE TO PASTEBOARD**|Add instead of replace|
	|**PHP SET OPTION**|Only applies to next call|
	|**Is picture file**|Validate data|
	|**PICTURE CODEC LIST**|Return list of reading (decoding) Codecs instead list of writing (encoding) Codecs|
	|**READ PICTURE FILE**|Accept any type of file|
	|**Frontmost process**|Of the first **non-floating** window|
	|**Frontmost window**|Of the first **floating** window|
	|**New process**<br>**Execute on server**|Unique process|
	|**Process number**|Return the process number from the server|
	|**REGISTER CLIENT**|Local process|
	|**QUERY**<br>**QUERY SELECTION**<br>**ORDER BY**<br>**QUERY BY ATTRIBUTE**<br>**QUERY SELECTION BY ATTRIBUTE**<br>**ORDER BY ATTRIBUTE**|Continue order flag|
	|**QUERY BY EXAMPLE**|Do not display the scroll bar|
	|**ST FREEZE EXPRESSIONS**|Update expressions before freezing them|
	|**SVG SET ATTRIBUTE**|Modify SVG image itself|
	|**Convert path POSIX to system**<br>**Convert path system to POSIX**|Encoding option|
	|**COPY DOCUMENT**|Override existing document if any|
	|**CREATE FOLDER**|Create folder hierarchy|
	|**SHOW ON DISK**|Show folder contents|
	|**Screen height**<br>**Screen width**|On Windows, screen instead of MDI window|
	|**GET ACTIVITY SNAPSHOT**|Server side activity|
	|**OPEN URL**<br>**WEB SEND HTTP REDIRECT**|Do not encode special characters|
	|**GET MOUSE**<br>**POST CLICK**|Coordinates relative to the main screen (or MDI window)|
	|**SET FIELD TITLES**<br>**SET TABLE TITLES**|Use the custom names in the formula editor|
	|**WEB SEND RAW DATA**|Send chunked|
	|**Open form window**|Save position and size|
	|**SET WINDOW RECT**|Do not change window to foreground|
	|**WINDOW LIST**|With floating windows|
	|**SQL LOGIN**|Change the target of the SQL code executed within the Begin SQL/End SQL tags|
	




