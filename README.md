# COMMANDS FOR DEVELOPEMENT AUTOMATION

I am using MacOS and here you can find commands to automate your daily tasks.

Command description:
It changes branch, adds all changes, commits everything and pushes to your branch. One command to do it all.

```
function gac() {
    if [ "$1" = "--help" ]; then
        echo "Usage: gac 'commit message' branch_name"
        echo "Example: gac 'fix issue #123' main"
    elif [ -z "$1" ] || [ -z "$2" ]; then
        echo "Usage: gac 'commit message' branch_name"
    else
        if git status; then
            git checkout -B "$2"
            git status
            git add .
            git commit -m "$1"
            git push origin "$2"
        else
            echo "No changes to commit."
        fi
    fi
}
```

put this command at the end of .zshrc file.
To open this file you could use commands such as:
For VS CODE:
```
code ~/.zshrc
```

Or just open in terminal
```
nano ~/.zshrc
```

after you saved the file, use 
```
source ~/.zshrc
```

If your command still doesn't work, reopen terminal and run it again. If you have any questions, use chatGPT :) fastest and easiest way to solve any problem you are having.
