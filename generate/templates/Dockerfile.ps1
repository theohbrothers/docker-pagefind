@"
FROM alpine:3.17

ENV npm_config_yes=true

# Install pagefind
RUN set -eux; \
    apk add --no-cache npm; \
    npm_config_yes=true npx pagefind@$( $VARIANT['_metadata']['package_version'] ) --version; \
    mv ~/.npm/_npx/*/node_modules/@pagefind/*/bin/pagefind_extended /usr/local/bin/pagefind_extended; \
    pagefind_extended --version; \
    apk del npm;\
    rm -rf ~/.npm;

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh

WORKDIR /
ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "pagefind_extended", "--site", "/public" ]
"@
