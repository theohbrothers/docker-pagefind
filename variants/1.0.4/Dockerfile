FROM alpine:3.17
# Install pagefind_extended
RUN set -eux; \
    PAGEFIND_EXTENDED_VERSION=v1.0.4; \
    case "$( uname -m )" in \
        'x86') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.0.4/pagefind_extended-v1.0.4-x86_64-unknown-linux-musl.tar.gz"; \
            SHA256=61cdee630d3fbb30763a982ed0c895731d143d6c60a96c37f261aba4837cb930; \
            ;; \
        'x86_64') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.0.4/pagefind_extended-v1.0.4-x86_64-unknown-linux-musl.tar.gz"; \
            SHA256=61cdee630d3fbb30763a982ed0c895731d143d6c60a96c37f261aba4837cb930; \
            ;; \
        'aarch64') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.0.4/pagefind_extended-v1.0.4-aarch64-unknown-linux-musl.tar.gz"; \
            SHA256=f450a5bb1f372fbf140fa59bdd0fc424900b7317f67f82538286ccf90e6498de; \
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