# Strictly compare two strings

No diacritic comparator in 4D language. So here is some solutions

* 1 - [Legacy]

```4d
C_BOOLEAN($equal)
C_LONGINT($i)
$equal:=(Length($t1)=Length($t2))
If ($equal)
	  //%R-
	For ($i;1;Length($t1);1)
		$equal:=$equal & (Character code($t1[[$i]])=Character code($t2[[$i]]))
	End for 
	  //%R+
End if 
```
* 2 - [v11+]

```4d
$equal:=(Length($t1)=Length($t2)) & (Position($t1;$t2;1;*)=1)
```

* 3 - [v11+] *Be sure that the strings to compare do not contain regular expression metacharacters (like: \*, .[dot], +,?, (, [, \, ...) or take care to escape them*

```4d
$equal:=Match regex("(?m-si)^"+$t1+"$";$t2;1)
```
* 4 - [v17+]

```4d
$equal:=OB Is defined(New object($t1;1);$t2)
```
* 5 - [v17+] *The dot notation must be activated*

```4d
$equal:=New collection($t1).equal(New collection($t2);ck diacritical)
```

* 6 - [v18R6+]

```4d
$equal:=Compare strings($t1; $t2; sk char codes)=0
```

# Benchmarking

In compiled mode (mac OS: 12.1 - Processor: 2,6 GHz 6-Core Intel Core i7) for 1M comparaisons <a href="https://github.com/vdelachaux/tip-and-tricks/blob/master/Methods/Comparison.4dm">See the method</a>

|   |             |  ms |   |
|---|-------------|-----|---|
| 1 |For (%R-)    |~~1865~~|**<-- Optimization 18R3 = 31 ms**|
| 2 |Position(\*) |124  ||
| 3 |Regex        |514  ||
| 4 |Object       |1128  ||
| 5 |Collection   |1670 ||
| 6 |Compare string |100||
