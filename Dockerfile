FROM haskell:8.6.3 AS builder
RUN useradd --user-group --create-home --home-dir /home/builder builder
USER builder:builder
RUN cabal update && cabal install happy-1.19.9 alex-3.2.4
RUN mkdir /home/builder/build
COPY ./corrode.cabal /home/builder/build/
RUN cd /home/builder/build && cabal install --only-dependencies -j4
COPY . /home/builder/build/
RUN cd /home/builder/build && cabal install

FROM debian:stable-slim
RUN useradd --user-group corrode
USER corrode:corrode
COPY --from=builder /home/builder/.cabal/bin/corrode /opt/corrode/bin/corrode
ENTRYPOINT ["/opt/corrode/bin/corrode"]
CMD ["--help"]
