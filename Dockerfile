
# http://support.ghost.org/supported-node-versions/
# https://github.com/nodejs/LTS
FROM node:4-slim

RUN apt-get update && apt-get install -y \
		ca-certificates \
		wget \
	--no-install-recommends && rm -rf /var/lib/apt/lists/*

ENV GHOST_SOURCE /usr/src/ghost
WORKDIR $GHOST_SOURCE

ENV GHOST_CONTENT /var/lib/ghost
RUN mkdir -p "$GHOST_CONTENT"
VOLUME $GHOST_CONTENT

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 2368
CMD ["npm", "start"]
