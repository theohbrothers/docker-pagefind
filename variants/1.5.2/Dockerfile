FROM alpine:3.17
# Install pagefind_extended
RUN set -eux; \
    PAGEFIND_EXTENDED_VERSION=v1.5.2; \
    case "$( uname -m )" in \
        'x86') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.5.2/pagefind_extended-v1.5.2-x86_64-unknown-linux-musl.tar.gz"; \
            SHA256=aeb135927856e7a49816cf2c9c2e53167f87afa1f61f7288b7d66c234a950d38; \
            ;; \
        'x86_64') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.5.2/pagefind_extended-v1.5.2-x86_64-unknown-linux-musl.tar.gz"; \
            SHA256=aeb135927856e7a49816cf2c9c2e53167f87afa1f61f7288b7d66c234a950d38; \
            ;; \
        'aarch64') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.5.2/pagefind_extended-v1.5.2-aarch64-unknown-linux-musl.tar.gz"; \
            SHA256=3f667f37fb6c03006212cea2a28cd26c0b47eb797c1113cad716dfff712ff19d; \
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