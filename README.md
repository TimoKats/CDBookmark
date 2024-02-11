# CDBookmark

CDBookmark is a shell script that allows you to bookmark directories and easily change to them with one command. 

### Setup

You can `git clone` this repo or just copy the `cdb.sh` file into your file system. Next, you can add an alias for it in your `.bashrc` (in your home folder). IMPORTANT, the leading `.` in the alias is required.

```Shell
alias cdb='. /<path>/<to>/<cdbookmark>/<copy>/cdb.sh'
```

Next, you can run `source ~/.bashrc` to activate the alias. If this step is succesfull, you can run `cdb info` (assuming you named the alias cdb) and be prompted something similar to this:

```
---
CDBookmark is maintained by Timo Kats (tpakats@gmail.com).
Last update: 10 Feb 2024
License: GNU GPLv3
Version: v1.0.0
---
Current bookmark location: /<path>/<to>/<cdbookmark>/<copy>/.bookmarks.txt
---
```

### Usage

CDBookmark has 4 core functionalties: add, delete, list, \<bookmark\>.   

#### 1: cdb add \<bookmark\>
This will add your current directory (i.e. what you would get if you'd run `pwd`) to your bookmarks under the name \<bookmark\>.

#### 2: cdb delete \<bookmark\>
This will delete the bookmark called \<bookmark\>.

#### 3: cdb list
This will list all bookmarks along with their directories.

#### 4: cdb \<bookmark\>
Here, \<bookmark\> refers to the name of the bookmark that you created. Hence, the command `cdb <bookmark>` will cd to the directory you bookmarked.
