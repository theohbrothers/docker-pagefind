@"
FROM alpine:3.17

"@

Generate-DownloadBinary @{
    binary = 'pagefind_extended'
    version = "v$( $VARIANT['_metadata']['package_version'] )"
    repository = 'CloudCannon/pagefind'
    archiveformat = '.tar.gz'
    archivefiles = @(
        'pagefind_extended'
    )
    architectures = $VARIANT['_metadata']['platforms']
    testCommand = 'pagefind_extended --version'
}

@"
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh

WORKDIR /
ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "pagefind_extended", "--site", "/public" ]
"@
