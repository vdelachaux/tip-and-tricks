# How to locate the current 4D Folder?

### Solution 1 - manually

Open the Maintenance and Security Center (MSC) and on the Information page, click on the "4D Folder" item then select the "4D" item to open the folder.


### Solution 2 - Code

```4d
SHOW ON DISK (Get 4D folder (Active 4D Folder))
```