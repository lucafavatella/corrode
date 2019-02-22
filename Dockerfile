ARG GHCVER=8.0.2
FROM haskell:${GHCVER} AS builder
ARG HAPPYVER=1.19.5
ARG ALEXVER=3.2.1
RUN useradd --user-group --create-home --home-dir /home/builder builder
USER builder:builder
RUN cabal update && cabal install happy-${HAPPYVER} alex-${ALEXVER}
RUN mkdir /home/builder/build
COPY ./corrode.cabal /home/builder/build/
RUN cd /home/builder/build && cabal install --only-dependencies -j4
COPY . /home/builder/build/
RUN cd /home/builder/build && cabal install

FROM debian:buster-slim
RUN useradd --user-group corrode
USER corrode:corrode
COPY --from=builder /home/builder/.cabal/bin/corrode /opt/corrode/bin/corrode
ENTRYPOINT ["/opt/corrode/bin/corrode"]
CMD ["--help"]
