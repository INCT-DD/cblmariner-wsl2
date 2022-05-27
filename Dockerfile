FROM cblmariner.azurecr.io/base/core:2.0

LABEL "Author"="Alexandre Teles <alexandre.teles@ufba.br>"

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN tdnf -y update && \
    tdnf -y upgrade && \
    tdnf -y install mariner-repos-extended && \
    tdnf -y update && \
    tdnf -y upgrade && \
    tdnf install -y core-packages-base-image cracklib-dicts \
    at man python3-pip acl bash-completion binutils nano vim
