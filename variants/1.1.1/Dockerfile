FROM alpine:3.17
# Install pagefind_extended
RUN set -eux; \
    PAGEFIND_EXTENDED_VERSION=v1.1.1; \
    case "$( uname -m )" in \
        'x86') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.1.1/pagefind_extended-v1.1.1-x86_64-unknown-linux-musl.tar.gz"; \
            SHA256=6b1deb1621303d8f75f8ea31591a5c862e8dc3302122b60abd97601057621925; \
            ;; \
        'x86_64') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.1.1/pagefind_extended-v1.1.1-x86_64-unknown-linux-musl.tar.gz"; \
            SHA256=6b1deb1621303d8f75f8ea31591a5c862e8dc3302122b60abd97601057621925; \
            ;; \
        'aarch64') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.1.1/pagefind_extended-v1.1.1-aarch64-unknown-linux-musl.tar.gz"; \
            SHA256=c393ff468b8b61ad92cef291395c22537456856026b4d7e750b52282a4e00e82; \
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