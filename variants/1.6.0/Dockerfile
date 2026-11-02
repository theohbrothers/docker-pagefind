FROM alpine:3.17
# Install pagefind_extended
RUN set -eux; \
    PAGEFIND_EXTENDED_VERSION=v1.6.0; \
    case "$( uname -m )" in \
        'x86') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.6.0/pagefind_extended-v1.6.0-x86_64-unknown-linux-musl.tar.gz"; \
            SHA256=20a992fd64af2ee4fbf39b99245a1135303b6813f79af7ac72a5e27247919b07; \
            ;; \
        'x86_64') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.6.0/pagefind_extended-v1.6.0-x86_64-unknown-linux-musl.tar.gz"; \
            SHA256=20a992fd64af2ee4fbf39b99245a1135303b6813f79af7ac72a5e27247919b07; \
            ;; \
        'aarch64') \
            URL="https://github.com/CloudCannon/pagefind/releases/download/v1.6.0/pagefind_extended-v1.6.0-aarch64-unknown-linux-musl.tar.gz"; \
            SHA256=46bc248d9b9fa361044d90d7adce4e7fb42156da5256c16da3c7ca6fbc15c9eb; \
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