MUST
DONE 161 Docker fix attempt (required further fixes)
DONE 147 cabal update in readme + typos in readme
* (176 cabal update in readme)

SHOULD
DONE 145 CI cache. Taken from https://github.com/commercialhaskell/stack/blob/stable/doc/travis-complex.yml (via https://docs.haskellstack.org/en/stable/travis_ci/)
175 language-c 0.7 (stack missing?) + app version bump (!) + gitignore
154 removal of stale renames doc (in code file changed by integration tests PR 141)

COULD
141 integration tests (includes code moved, interface change)
170 4 rename rules, in correct order
* (157 3 rename rules, in wrong order)

WONT
159 fix for enum bug (uses PartialEq) but test not integrated in CI
110 macOS fixes? misc of changes. lacks test.
146 ignores extern for function definitions (and function declarations?), skips mingw __debugbreak, has tests integrated in CI, depends on 141
171 feature table, WIP
166 feature enums (uses PartialEq), WIP
63 feature unions, WIP
143 gitignore cabal sandbox???
