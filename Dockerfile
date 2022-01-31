FROM scratch

LABEL maintainer="Wilton Rodrigues <wiltonsr94@gmail.com>"

COPY ./kindlegen /

VOLUME ["/source"]

WORKDIR /source

ENTRYPOINT ["/kindlegen"]