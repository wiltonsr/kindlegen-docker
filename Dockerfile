FROM scratch

LABEL maintainer="Wilton Rodrigues <wiltonsr94@gmail.com>"

ADD tmp.tar.gz /

COPY ./kindlegen /

VOLUME ["/source"]

WORKDIR /source

ENTRYPOINT ["/kindlegen"]