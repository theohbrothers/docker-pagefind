FROM alpine:3.17
# Install pagefind_extended
RUN set -eux; \
    PAGEFIND_EXTENDED_VERSION=v1.3.0; \
    case "$( uname -m )" in \
        'x86') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.3.0/pagefind_extended-v1.3.0-x86_64-unknown-linux-musl.tar.gz"; \
            SHA256=f983dec5507d87c7c497c450d2c5de97fc967a46d26e0ac3fb7184a87c94e434; \
            ;; \
        'x86_64') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.3.0/pagefind_extended-v1.3.0-x86_64-unknown-linux-musl.tar.gz"; \
            SHA256=f983dec5507d87c7c497c450d2c5de97fc967a46d26e0ac3fb7184a87c94e434; \
            ;; \
        'aarch64') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.3.0/pagefind_extended-v1.3.0-aarch64-unknown-linux-musl.tar.gz"; \
            SHA256=21294be42afd75818f3c38b26ec69ee3fa68a98f2396e412c1ebb72727b4c526; \
            ;; \
        *) \
            echo "Architecture not supported"; \
            exit 1; \
            ;; \
    esac; \
    FILE=pagefind_extended.tar.gz; \
    wget -q "$URL" -O "$FILE"; \
    echo "$SHA256  $FILE" | sha256sum -c -; \
    mkdir -p extract; \
    tar -C extract -xvf "$FILE" --no-same-owner --no-same-permissions -- pagefind_extended; \
    mkdir -pv /usr/local/bin; \
    BIN=$( find extract -type f -name "pagefind_extended" | head -n1 ); \
    mv -v "$BIN" /usr/local/bin/pagefind_extended; \
    chmod +x /usr/local/bin/pagefind_extended; \
    pagefind_extended --version; \
    rm -rf extract; \
    rm -f "$FILE"; \
    :

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh

WORKDIR /
ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "pagefind_extended", "--site", "/public" ]