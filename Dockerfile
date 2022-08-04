FROM debian:bookworm-slim

RUN apt-get update \
	&& apt-get install -y --no-install-recommends lsb-release wget ca-certificates software-properties-common gnupg git cmake make \
	&& wget -O - https://apt.llvm.org/llvm.sh | bash -s -- 14 \
	&& apt-get install -y --no-install-recommends clang mold


RUN git clone https://github.com/metacall/core.git \
	&& mkdir -p core/build && cd core/build \
	&& cmake \
		-DCMAKE_C_FLAGS="-B /usr/lib/mold" \
		-DCMAKE_CXX_FLAGS="-B /usr/lib/mold" \
		-DCMAKE_C_COMPILER=clang .. \
		-DCMAKE_CXX_COMPILER=clang++ .. \
	&& make -j$(nproc) \
	&& ctest
