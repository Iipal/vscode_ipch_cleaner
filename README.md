# VSCode ipch cleaner

Little bash script for delete temporary C/C++ IntelliSense VSCode __`ipch`__ folders.

What is __`ipch`__ folders ?

IPCH - IntelliSense Precompiled Header File
-
> Contains precompiled header information used by IntelliSense, Microsoft's code assistance module used for code hinting, documentation, and autocompletion while the programmer types source code.

You can easily find this folder on `.vscode` folder in you project folder (also it's `${workspaceFolder}/.vscode`).

Be sure this script have permission to run:
```bash
chmod u+x vscode_ipch_cleaner.sh
```

If you run it without arguments, it's will delete all __`ipch`__ folders from your home directory(`~`).

Exist flags:

`-f` flag to only find all __`ipch`__ folder from your home directory(`~`) without deleting.
```bash
$> ./vscode_ipch_cleaner.sh -f
find: /Users/tmaluh/.DocumentRevisions-V100: Permission denied
find: /Users/tmaluh/.fseventsd: Permission denied
find: /Users/tmaluh/.TemporaryItems: Permission denied
/Users/tmaluh/WU_Algorithm/.vscode/ipch
```

`-p` flag to choose from what folder delete will delete all __`ipch`__ folders.
```bash
$> ./vscode_ipch_cleaner.sh -p ~/WU_Algorithm
/Users/tmaluh/WU_Algorithm/.vscode/ipch/d2a838ba5f85bbb4/u_rand.ipch
/Users/tmaluh/WU_Algorithm/.vscode/ipch/d2a838ba5f85bbb4
/Users/tmaluh/WU_Algorithm/.vscode/ipch
find: /Users/tmaluh/WU_Algorithm/.vscode/ipch: No such file or directory
```
Last line "__find: ...: No such file or directory__" tell you about what all works fine and this folder successly deleted.
