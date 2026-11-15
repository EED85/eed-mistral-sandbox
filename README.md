# eed_package_template

## Creating a New Repository from This Template

1. In the EED-Solutions organization, create a new repository using this template and assign it a new name, such as `eed_my_new_package`.
2. Create a new branch (e.g., `repo_configuration`).
3. Rename the directory `src/eed_package_template` to match your new package name (e.g., `src/eed_my_new_package`).
4. Delete the `uv.lock` file.
5. Update `project.toml` by renaming `eed-package-template` to your new package name (e.g., `eed-my-new-package`). set version to ``0.1.0``. Update your decription.
6. Set up a virtual environment using `uv`.
7. Install pre-commit hooks.
8. Update Readme:

Remove section ``## Creating a New Repository from This Template``


Add a note indicating the commit ID from which this repository was created, for example:
   ```
   - created from this template: https://github.com/EED-Solutions/eed_package_template/releases/tag/0.1.0
   ```

9. Use VS Code's find and replace feature to update all instances of `eed_package_template` with your new package name.
10. Commit all changes, create a pull request, and ensure all CI pipelines pass.
11. Update repository settings as needed (e.g., import branch/tag rulesets, general settings). For more information, see [this guide](https://eed-solutions.atlassian.net/wiki/x/BIA8Mw) (private access). Rulesets are documented under ``.github\rulesets`` and can be imported.
12. Merge the pull request and create the initial release (e.g., `0.1.0`).

## Github actions

Workflows are centraly hosted in EED_Solutions/eed_gha_workflows.
Please check for more details here.

## Development container

The Dev Container and Docker Compose use the same image, built from
[`.devcontainer/Dockerfile`](.devcontainer/Dockerfile).

Run these commands in PowerShell from the repository root (the folder
containing `docker-compose.yml`). Compose reads `MISTRAL_API_KEY` from the
root-level `.env` file; it is not configured in the Dockerfile. Create the
ignored local file and add your key:

```sh
Copy-Item .env.example .env
notepad .env
```

Compose automatically loads `.env` from the project directory. To specify it
explicitly, add `--env-file .env` after `docker compose` to any command below.
The file is git-ignored; do not put the key in the Dockerfile or commit `.env`.

Build and start the service in the background:

```powershell
docker compose build
docker compose up -d ai
```

Docker Desktop must be running. Enable **Start Docker Desktop when you sign in**
in its General settings if you want it available after signing into Windows.
The container uses `restart: unless-stopped`, so Docker Desktop restarts it
after a Windows reboot unless you explicitly stopped it.

Manage and connect to the container:

```powershell
docker compose ps -a          # list this project's containers
docker ps -a                  # list all containers on this Docker engine
docker compose exec ai bash   # open a shell in the running container
docker compose exec ai vibe   # launch the interactive Mistral CLI
docker compose logs -f ai     # follow container logs
docker compose restart ai     # restart the service
docker compose stop ai        # stop it; keeps the container and data
docker compose start ai       # start a stopped container again
```

`docker compose up -d ai` also starts (or creates) the service. To remove the
container and network while keeping Vibe's named data volume, use
`docker compose down`. **Do not use `docker compose down -v`** unless you intend
to delete that volume and Vibe's saved local state.

In VS Code, choose **Reopen in Container** to use the same Compose service. The
project files are mounted at `/workspace`; Vibe's `~/.vibe` data is stored in
a named Docker volume and survives container recreation. If you change the API
key in `.env`, recreate the container to pass the new value:

```powershell
docker compose up -d --force-recreate ai
```

Mistral Vibe is the interactive coding assistant CLI, similar in purpose to
Claude Code. Start it in the project from the container:

```sh
docker compose exec ai vibe
```

The Compose service passes `MISTRAL_API_KEY` from `.env` to Vibe. The Vibe data
volume is local to Docker and is not committed to Git.

The container also includes `eza`, `fzf`, and Starship. Starship is the default
prompt in interactive Bash shells; fzf's Bash key bindings are loaded on shell
startup (for example, `Ctrl+R` for history search and `Ctrl+T` for file
search).

LiteLLM is installed as a `uv` development dependency, so `uv sync` makes its
`litellm` command available in the project environment. LiteLLM provides an API
proxy rather than an interactive Mistral chat CLI. To start a proxy for a
Mistral model from Compose:

```sh
docker compose exec ai uv sync
docker compose exec ai uv run litellm --host 0.0.0.0 --model mistral/mistral-large-latest
```

The proxy is available on localhost port 4000 while it is running.

## Other

Test EED85-machine
