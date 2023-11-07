FROM alpine:3.17
# Install pagefind_extended
RUN set -eux; \
    PAGEFIND_EXTENDED_VERSION=v0.5.3; \
    case "$( uname -m )" in \
        'x86') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v0.5.3/pagefind_extended-v1.0.3-x86_64-unknown-linux-musl.tar.gz"; \
            SHA256=aec60f1db9fd693986b2c3d6253f98e6710e5046a371fc1c7e3ecc5fc982a95d; \
            ;; \
        'x86_64') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v0.5.3/pagefind_extended-v1.0.3-x86_64-unknown-linux-musl.tar.gz"; \
            SHA256=aec60f1db9fd693986b2c3d6253f98e6710e5046a371fc1c7e3ecc5fc982a95d; \
            ;; \
        'aarch64') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v0.5.3/pagefind_extended-v1.0.3-aarch64-unknown-linux-musl.tar.gz"; \
            SHA256=575885fb7086a31b9322b7bba0b0baf57bb2586b1fcc7661a88a73ffe17c8134; \
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