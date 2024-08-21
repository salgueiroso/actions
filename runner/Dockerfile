FROM ubuntu:24.04

RUN cat /etc/os-release 

WORKDIR /runner

RUN apt-get update -y \
    && apt-get install -y \
    wget \
    ca-certificates \
    libc6 \
    libgcc-s1 \
    libgssapi-krb5-2 \
    libicu74 \
    liblttng-ust1 \
    libssl3 \
    libstdc++6 \
    libunwind8 \
    zlib1g \
    curl \
    libdigest-sha-perl \
    jq \
    && apt-get clean

# RUN wget https://packages.microsoft.com/config/ubuntu/24.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
#     && dpkg -i packages-microsoft-prod.deb \
#     && rm packages-microsoft-prod.deb

RUN curl -o actions-runner-linux-x64-2.319.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.319.1/actions-runner-linux-x64-2.319.1.tar.gz

RUN echo "3f6efb7488a183e291fc2c62876e14c9ee732864173734facc85a1bfb1744464  actions-runner-linux-x64-2.319.1.tar.gz" | shasum -a 256 -c

RUN tar xzf ./actions-runner-linux-x64-2.319.1.tar.gz

RUN ./bin/installdependencies.sh

RUN useradd --user-group --system --create-home --no-log-init runner
RUN chown -R runner /runner
USER runner

ADD --chown=runner:runner start.sh .
RUN chmod +x start.sh

ENV pat=
ENV repo=

ENTRYPOINT [ "./start.sh" ]
