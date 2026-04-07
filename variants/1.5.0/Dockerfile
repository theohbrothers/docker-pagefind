FROM alpine:3.17
# Install pagefind_extended
RUN set -eux; \
    PAGEFIND_EXTENDED_VERSION=v1.5.0; \
    case "$( uname -m )" in \
        'x86') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.5.0/pagefind_extended-v1.5.0-x86_64-unknown-linux-musl.tar.gz"; \
            SHA256=533334d65cfdf9a09090654f45264f52fed189168956be51243ddf9305d592f2; \
            ;; \
        'x86_64') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.5.0/pagefind_extended-v1.5.0-x86_64-unknown-linux-musl.tar.gz"; \
            SHA256=533334d65cfdf9a09090654f45264f52fed189168956be51243ddf9305d592f2; \
            ;; \
        'aarch64') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.5.0/pagefind_extended-v1.5.0-aarch64-unknown-linux-musl.tar.gz"; \
            SHA256=d2a2a14fe89c7cbec913ffe735e4bdc67548ea0e73ce709bed5917be6908b257; \
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