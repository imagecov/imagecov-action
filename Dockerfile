FROM homebrew/brew:latest AS brew
RUN brew tap anchore/syft \
    && brew install syft \
    && brew tap anchore/grype \
    && brew install grype

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]