# VSCode ipch cleaner

## About:

Little bash script for delete temporary C/C++ IntelliSense VSCode __`ipch`__ folders.

What is __`ipch`__ folders ?

IPCH - IntelliSense Precompiled Header File
-
> Contains precompiled header information used by IntelliSense, Microsoft's code assistance module used for code hinting, documentation, and autocompletion while the programmer types source code.

You can easily find this folder in `.vscode` folder in you project folder (also it's `${workspaceFolder}/.vscode`).

## Additional:
Be sure this script have permission to run:
```bash
chmod u+x vscode_ipch_cleaner.sh
```

## Flags:

###### If you run it without arguments, it's will delete all __`ipch`__ folders from your home directory(`~`).
| Flag | Description                                                                  | Argmunets                                                                                              |
| ---- | ---------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| -f   | Finds all __`ipch`__ folders from the specified directory. (default: `~`)    | Directory. (Optional)                                                                                  |
| -p   | Deleting all __`ipch`__ folders from the specified directory. (default: `~`) | Directory. (Optional)                                                                                  |
| -q   | Activate quiet mode. (No deleting info output)                               | 1: Directory. (Necessary) 2: Path to file in which will be printed output from quiet mode. (Nccessary) |

> Last line in scripts output "__find: ...: No such file or directory__" tell you about what all works fine and this folder successly deleted.

## Recomendation
Most effectivly way to use this script it's create alias without output info and add it's to your .[bash/zsh]rc:
```bash
echo "alias ipch_clear='~/vscode_ipch_cleaner/vscode_ipch_cleaner.sh -q ~ /dev/null'" >> ~/.zshrc
```
or similar equivalent:
```bash
echo "alias ipch_clear='~/vscode_ipch_cleaner/vscode_ipch_cleaner.sh >> /dev/null'" >> ~/.zshrc
```

## Something else...
Or you can set maximum cache size in Mb in VSCode settings:
```json
"C_Cpp.intelliSenseCacheSize": 1024
```
whatever...
