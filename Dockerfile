FROM kong:0.13
LABEL maintainer="Alex Moreno"

RUN mkdir -p /usr/local/kong/plugins
COPY plugins /usr/local/kong/plugins
RUN yum install git -y \
    && yum install zip -y \
    && yum install vim -y \
    && cd /usr/local/kong/plugins/middleman \
    && /usr/local/bin/luarocks make *.rockspec make *.rockspec

ENV KONG_CUSTOM_PLUGINS middleman
