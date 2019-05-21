FROM gitpod/workspace-dotnet:latest

USER root
# Install custom tools, runtime, etc.
RUN apt-get update && apt-get install -y \
        powershell \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

USER gitpod

# Clone Scoops main repository
RUN git config --global core.autocrlf true \
    && git clone https://github.com/lukesampson/scoop $HOME/scoop --depth=1

# Apply user-specific settings
ENV SCOOP_DEBUG=true
ENV SCOOP_HOME=$HOME/scoop

# Give back control
USER root
