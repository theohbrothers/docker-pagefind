FROM alpine:3.17
# Install pagefind_extended
RUN set -eux; \
    PAGEFIND_EXTENDED_VERSION=v1.1.0; \
    case "$( uname -m )" in \
        'x86') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.1.0/pagefind_extended-v1.1.0-x86_64-unknown-linux-musl.tar.gz"; \
            SHA256=583cf2753fb2070448a9c9cf1f31acd1b96af99b9ca0a450faf9bb376420bac4; \
            ;; \
        'x86_64') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.1.0/pagefind_extended-v1.1.0-x86_64-unknown-linux-musl.tar.gz"; \
            SHA256=583cf2753fb2070448a9c9cf1f31acd1b96af99b9ca0a450faf9bb376420bac4; \
            ;; \
        'aarch64') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.1.0/pagefind_extended-v1.1.0-aarch64-unknown-linux-musl.tar.gz"; \
            SHA256=b05661d856372beea75468ea683f197b465e019f033259768f65988c9598f390; \
            ;; \
        *) \
            echo "Architecture not supported"; \
            exit 1; \
            ;; \
    esac; \
    FILE=pagefind_extended.tar.gz; \
    wget -q "$URL" -O "$FILE"; \
    echo "$SHA256  $FILE" | sha256sum -c -; \
    tar -xvf "$FILE" --no-same-owner --no-same-permissions -- pagefind_extended; \
    rm -f "$FILE"; \
    mkdir -pv /usr/local/bin; \
    mv -v pagefind_extended /usr/local/bin/pagefind_extended; \
    chmod +x /usr/local/bin/pagefind_extended; \
    pagefind_extended --version; \
    :

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh

WORKDIR /
ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "pagefind_extended", "--site", "/public" ]