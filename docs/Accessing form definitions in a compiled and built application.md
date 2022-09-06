# How to Access form definitions in a compiled and built application

As you know, the build phase of an application generates a `.4Z` file in which the source code of methods and classes is removed. But the form definition is still present.

Some developments require loading the definition of a form to modify it on the fly before presenting it to the user. 

* A commonly used solution is to create the form in the structure, then copy its definition to the resources folder. Don't forget to update it after each modification. 
* Another method is to use the **ZIP Read archive** command to read/extract the file(s) from the `.4DZ` archive. But this way cannot be used if the [archive is protected](https://blog.4d.com/secure-your-apps-resources-with-a-new-algorithm/) with the buildApp key `UseStandardZipFormat` set to `False`.  

## There is an easier way

The thing to know is that the **File** and **Folder** commands are able to operate on a `.4DZ` file if it is open in memory.    
And this is necessarily the case since the application is loaded even if the `.4DZ` file is protected.

So the only problem to solve is the access path which is different in interpreted mode and in compiled mode. 

* In interpreted mode, you access the "Forms" folder with : 

```4d
Folder("/PROJECT/Project/Sources/Forms")
```
* In compiled and built mode with : 

```4d
Folder("/PROJECT/Sources/Forms")
```
> Note that the "Sources" folder is in the root and not in a "Project" folder.

So to have a coherent behavior in interpreted/compiled mode you have to do for example:

```4d
If (Is compiled mode)		$file:=File("/PROJECT/Sources/Forms/Form1/form.4DForm")	Else 		$file:=File("/PROJECT/Project/Sources/Forms/Form1/form.4DForm")	End if 
```

