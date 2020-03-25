# Strictly compare two strings

No diacritic comparator in 4D language. So here is some solutions

* 1 - Legacy

```4d
$equal:=(Length($t1)=Length($t2)) & (Position($t1;$t2;1;*)=1)
```
* 2 - Object

```4d
$equal:=OB Is defined(New object($1;1);$2)
```
* 3 - Collection

	*Warning: The dot notation must be activated*

```4d
$equal:=New collection($t1).equal(New collection($t2);ck diacritical)
```

* 4 - Regex

	*If you are sure that the strings to compare do not contain regular expression metacharacters (like: \*, .[dot], +,?, (, [, \, ...) or take care to escape them*

```4d
$equal:=Match regex("(?m-si)^"+$t1+"$";$t2;1)
```




