ARG N8N_VERSION=latest
FROM n8nio/n8n:${N8N_VERSION}

USER root
# Install all external libs you need
RUN npm install -g \
    # pg pg-connection-string \
    redis \
    && npm cache clean --force

USER node
