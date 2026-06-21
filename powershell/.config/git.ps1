function lg {
    lazygit
}

function gs {
    git status --short --branch
}

function gl {
    git log `
        --graph `
        --decorate `
        --oneline `
        --all `
        -n 20
}

function gr {
    Set-Location (git rev-parse --show-toplevel)
}
