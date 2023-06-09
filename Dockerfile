FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive
ENV HELPER_SCRIPTS=./helpers
ENV INSTALLER_SCRIPT_FOLDER=/imagegeneration/installers/
ENV AGENT_TOOLSDIRECTORY=/opt/hostedtoolcache/

COPY ./vendor/scripts .
COPY ./vendor/toolsets .

RUN  apt-get update -yqq && apt-get install -yqq jq wget curl unzip lsb-release sudo lbzip2 zstd \
    && echo 'echo $@' > /usr/bin/invoke_tests \
    && chmod +x /usr/bin/invoke_tests \
    && echo 'echo "$(jq -r "$query" toolset-2204.json)"' > /usr/bin/get_toolset_value \
    && chmod +x /usr/bin/get_toolset_value \
    && mkdir -p /imagegeneration/installers/ \
    && cp toolset-2204.json /imagegeneration/installers/toolset.json \
    && bash base/repos.sh \
    && bash installers/configure-environment.sh \
    && apt-get install -yqq $(jq -r '.apt.common_packages | join(" ")' toolset-2204.json) \
    && apt-get install -yqq $(jq -r '.apt.cmd_packages | join(" ")' toolset-2204.json) \
    && bash installers/git.sh \
    && bash installers/github-cli.sh \
    && bash installers/nodejs.sh \
    #%%TOOL_SCRIPTS%%
    && chmod -R 777 /opt \
    && chmod -R 777 /usr/share \
    && mkdir -p /home/runner \
    && echo "runner:x:1000:1000:runner:/home/runner:/bin/bash" >> /etc/passwd \
    && echo "runner:x:1000:" >> /etc/group \
    && echo "runner::::::::" >> /etc/shadow \
    && chown -R runner /home/runner \
    && echo 'runner ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && bash installers/cleanup.sh

USER runner

WORKDIR /home/runner
