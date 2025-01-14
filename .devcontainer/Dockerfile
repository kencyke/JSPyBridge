FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

ARG USERNAME=vscode

RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
    && mkdir /commandhistory \
    && touch /commandhistory/.bash_history \
    && chown -R $USERNAME /commandhistory \
    && echo "$SNIPPET" >> "/home/$USERNAME/.bashrc"

RUN echo "source /usr/share/bash-completion/completions/git" >> "/home/$USERNAME/.bashrc"

RUN apt update \
    && apt-get install -y --no-install-recommends \
        python3-venv \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*