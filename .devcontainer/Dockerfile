FROM ghcr.io/astral-sh/uv:python3.13-bookworm-slim

WORKDIR /workspace

ARG TARGETARCH

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        bash \
        ca-certificates \
        curl \
        fd-find \
        fzf \
        git \
        gnupg \
        less \
        nano \
        procps \
        ripgrep \
        tar \
        unzip; \
    mkdir -p /usr/share/keyrings; \
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | \
        gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg; \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
        > /etc/apt/sources.list.d/github-cli.list; \
    apt-get update; \
    apt-get install -y --no-install-recommends gh; \
    ln -s /usr/bin/fdfind /usr/local/bin/fd; \
    mkdir -p /usr/local/share/fzf /tmp/fzf-package; \
    cd /tmp; \
    apt-get download fzf; \
    dpkg-deb -x fzf_*.deb /tmp/fzf-package; \
    install -m 0644 /tmp/fzf-package/usr/share/doc/fzf/examples/key-bindings.bash \
        /usr/local/share/fzf/key-bindings.bash; \
    rm -rf /tmp/fzf-package /tmp/fzf_*.deb; \
    rm -rf /var/lib/apt/lists/*

RUN set -eux; \
    case "${TARGETARCH}" in \
        amd64) eza_arch=x86_64; eza_sha256=35c70c5c43c29108075e58b893234c67ef585f0b53a7eaf8e9e7d4eec9f339b4 ;; \
        arm64) eza_arch=aarch64; eza_sha256=40b87ae8628aa2ff0f0d2dc24ab52f689631366385c3da630bae745671fd71ec ;; \
        *) echo "Unsupported architecture for eza: ${TARGETARCH}" >&2; exit 1 ;; \
    esac; \
    curl -fsSL "https://github.com/eza-community/eza/releases/download/v0.23.5/eza_${eza_arch}-unknown-linux-gnu.tar.gz" \
        -o /tmp/eza.tar.gz; \
    echo "${eza_sha256}  /tmp/eza.tar.gz" | sha256sum -c -; \
    tar -xzf /tmp/eza.tar.gz -C /usr/local/bin ./eza; \
    rm /tmp/eza.tar.gz; \
    curl -fsSL https://starship.rs/install.sh | sh -s -- --yes --bin-dir /usr/local/bin

RUN curl -sL https://install.duckdb.org | sh && \
    mkdir -p /usr/local/bin && \
    cp /root/.duckdb/cli/latest/duckdb /usr/local/bin/duckdb && \
    chmod +x /usr/local/bin/duckdb

# Playwright-Browser ins Image backen; das Python-Package selbst kommt
# aus der Projekt-Umgebung (pyproject dev-group, gleiche Version pinnen).
# Bibliotheken bewusst per Hand statt `--with-deps`: Liste abgeleitet aus
# Chromium-eigener deb.deps + ldd-Schluss einer Chromium-1255-Binärdatei.
ENV PLAYWRIGHT_BROWSERS_PATH=/ms-playwright
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        fonts-liberation \
        fonts-noto-color-emoji \
        libasound2 \
        libatk-bridge2.0-0 \
        libatk1.0-0 \
        libatspi2.0-0 \
        libatomic1 \
        libcairo2 \
        libcups2 \
        libdbus-1-3 \
        libdrm2 \
        libgbm1 \
        libglib2.0-0 \
        libnspr4 \
        libnss3 \
        libpango-1.0-0 \
        libwayland-client0 \
        libx11-6 \
        libxcb1 \
        libxcomposite1 \
        libxdamage1 \
        libxext6 \
        libxfixes3 \
        libxkbcommon0 \
        libxrandr2; \
    uvx --from playwright==1.65.2 playwright install chromium; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /root/.cache/uv

# Live-Betrachtung des automatisierten Browsers (NoVNC unter Port 6080)
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        novnc \
        websockify \
        x11vnc \
        xvfb; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m vscode && \
    mkdir -p /home/vscode/.vibe && \
    printf '\nif [[ $- == *i* ]]; then\n  source /usr/local/share/fzf/key-bindings.bash\n  eval "$(starship init bash)"\nfi\n' >> /home/vscode/.bashrc && \
    chown -R vscode:vscode /home/vscode
ENV UV_TOOL_BIN_DIR=/home/vscode/.local/bin
ENV PATH="/home/vscode/.local/bin:${PATH}"
USER vscode
RUN duckdb -c "INSTALL encodings; INSTALL excel; INSTALL httpfs; INSTALL quack; INSTALL sqlite; INSTALL ducklake" && \
    uv tool install mistral-vibe
