# MetaCall Core `mold` Example

This example shows how to build (and link) [MetaCall Core](https://github.com/metacall/core) by using [clang](https://clang.llvm.org/) compiler and [mold](https://github.com/rui314/mold) linker. The example has been promoted by [Ludovic Lagouardette](https://archivist.nekoit.xyz/author/ludovic/). The motivation for this is to produce more realistic benchmarks on top of MetaCall Core by means of mold shuffle linkage (aka `--shuffle-sections`).

## Building

We have used Docker in order to make it reproducible, but it can be built outside of Docker too, just check the commands used in the Dockerfile.

```sh
docker build -t metacall/core-mold-example .
```
