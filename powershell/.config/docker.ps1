# ==================================================
# Docker
# ==================================================

function docker-start {

    Start-Process `
        "$Env:ProgramFiles\Docker\Docker\Docker Desktop.exe"

    while ($true) {

        try {
            docker info *> $null
            break
        }
        catch {
            Start-Sleep 2
        }

    }
}

function docker-stop {

    Stop-Process `
        -Name "Docker Desktop" `
        -Force `
        -ErrorAction SilentlyContinue

    wsl --terminate docker-desktop 2>$null
}

function docker-restart {

    docker-stop

    Start-Sleep 2

    docker-start
}

# ==================================================
# PostgreSQL
# ==================================================

function pg-start {

    if (-not (
        docker ps -a --format "{{.Names}}" |
        Select-String "^postgres$"
    )) {

        docker run -d `
            --name postgres `
            --restart unless-stopped `
            -e POSTGRES_USER=postgres `
            -e POSTGRES_PASSWORD=postgres `
            -e POSTGRES_DB=app `
            -p 5432:5432 `
            -v postgres-data:/var/lib/postgresql/data `
            postgres:latest

        return
    }

    docker start postgres
}

function pg-stop {
    docker stop postgres
}

function pg-shell {
    docker exec -it postgres psql -U postgres
}

function pg-logs {
    docker logs -f postgres
}

# ==================================================
# Redis
# ==================================================

function redis-start {

    if (-not (
        docker ps -a --format "{{.Names}}" |
        Select-String "^redis$"
    )) {

        docker run -d `
            --name redis `
            --restart unless-stopped `
            -p 6379:6379 `
            -v redis-data:/data `
            redis:latest `
            redis-server --appendonly yes

        return
    }

    docker start redis
}

function redis-stop {
    docker stop redis
}

function redis-cli {
    docker exec -it redis redis-cli
}

function redis-logs {
    docker logs -f redis
}

# ==================================================
# Development Database
# ==================================================

function db-up {

    docker-start

    pg-start

    redis-start
}

function db-down {

    pg-stop

    redis-stop
}

function db-status {

    docker ps `
        --filter "name=postgres" `
        --filter "name=redis"
}
