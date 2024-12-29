FROM alpine:3.17
# Install pagefind_extended
RUN set -eux; \
    PAGEFIND_EXTENDED_VERSION=v1.2.0; \
    case "$( uname -m )" in \
        'x86') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.2.0/pagefind_extended-v1.2.0-x86_64-unknown-linux-musl.tar.gz"; \
            SHA256=7f7b265315384dc46819945449fb82b4dc38c7fbf2750cc2c42af6f81dbcca59; \
            ;; \
        'x86_64') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.2.0/pagefind_extended-v1.2.0-x86_64-unknown-linux-musl.tar.gz"; \
            SHA256=7f7b265315384dc46819945449fb82b4dc38c7fbf2750cc2c42af6f81dbcca59; \
            ;; \
        'aarch64') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.2.0/pagefind_extended-v1.2.0-aarch64-unknown-linux-musl.tar.gz"; \
            SHA256=e4a5a0812eb322b697b2f302608ee7c9b23cc4ca43484ea2391763a1d54c0438; \
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