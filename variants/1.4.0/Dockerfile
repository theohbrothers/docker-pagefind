FROM alpine:3.17
# Install pagefind_extended
RUN set -eux; \
    PAGEFIND_EXTENDED_VERSION=v1.4.0; \
    case "$( uname -m )" in \
        'x86') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.4.0/pagefind_extended-v1.4.0-x86_64-unknown-linux-musl.tar.gz"; \
            SHA256=33ae1f82f7028b6c15af3bc582d4ba2799372f74259eef7363a1fc677fcf0b2f; \
            ;; \
        'x86_64') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.4.0/pagefind_extended-v1.4.0-x86_64-unknown-linux-musl.tar.gz"; \
            SHA256=33ae1f82f7028b6c15af3bc582d4ba2799372f74259eef7363a1fc677fcf0b2f; \
            ;; \
        'aarch64') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.4.0/pagefind_extended-v1.4.0-aarch64-unknown-linux-musl.tar.gz"; \
            SHA256=92323299d7353a668bd7995eef243877385e940225c565ccabe3d0be93377125; \
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