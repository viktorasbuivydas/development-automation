# COMMANDS FOR DEVELOPEMENT AUTOMATION

I am using MacOS and here you can find commands to automate your daily tasks.

Available commands:
- [Commit changes in the specific branch](scripts/commit_changes)
- [Commit changes and merge your branch into main](scripts/merge_branch)

## Commit changes to your branch
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

## Commit changes and merge your branch into main
Command description:
It commits your updates, changes branch into main, merges your branch into main, pushes changes and gets back to the orginal branch

```
function gacm() {
    if [ "$1" = "--help" ]; then
        echo "Usage: gacm 'commit message' branch_name"
        echo "Example: gacm 'fix issue #123' dev"
    elif [ -z "$1" ] || [ -z "$2" ]; then
        echo "Usage: gacm 'commit message' branch_name"
    else
        current_branch=$(git branch --show-current)
        git checkout main
        git merge "$2"

        if git status; then
            git checkout "$current_branch"
            git add .
            git commit -m "$1"
            git push origin "$2"
            git checkout main
            git merge "$current_branch"
            git push origin main
            git checkout "$current_branch"
        else
            echo "No changes to commit."
            git checkout "$current_branch"
        fi
    fi
}
```
put command at the end of .zshrc file.
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
