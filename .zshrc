// Usage: gac 'commit message' branch_name

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
