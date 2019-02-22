.PHONY: docs
docs: doc/corrode.pdf doc/cfg.pdf doc/driver.pdf

PANDOC = pandoc

doc/corrode.pdf: src/Language/Rust/Corrode/C.md
	$(PANDOC) --from markdown --to latex --variable papersize=letter --variable geometry=margin=1in --output "$@" "$^"

doc/cfg.pdf: src/Language/Rust/Corrode/CFG.md
	$(PANDOC) --from markdown --to latex --variable papersize=letter --variable geometry=margin=1in --output "$@" "$^"

doc/driver.pdf: Main.md
	$(PANDOC) --from markdown --to latex --variable papersize=letter --variable geometry=margin=1in --output "$@" "$^"

.PHONY: corrode-docs-builder
corrode-docs-builder:
	docker build -t $@ doc

.PHONY: docs-on-docker
docs-on-docker: corrode-docs-builder
	$(MAKE) docs PANDOC="docker run --rm -v \"$(CURDIR)\":/tmp/build -w /tmp/build $^"

.PHONY: docker
docker:
ifdef BUILD_GHCVER
	docker build --build-arg GHCVER=$${BUILD_GHCVER:?} --build-arg HAPPYVER=$${BUILD_HAPPYVER:?} --build-arg ALEXVER=$${BUILD_ALEXVER:?} .
else
	docker build .
endif
