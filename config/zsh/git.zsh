function gwip() {
    git add -u
    if [ "$(git log -1 --pretty=%s)" = "WIP" ];
    then
        echo "WIP, ammending..."
        git commit --amend -m "WIP"
    else
        echo "WIP, new commit..."
        git commit -m "WIP"
    fi
}

