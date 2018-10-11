#! /bin/bash
#
# Script to build RISC-V ISA simulator, proxy kernel, and GNU toolchain with commit log output.
# Tools will be installed to $RISCV/logger.

. build.common

echo Starting RISC-V Toolchain build process
echo Tools will be installed to $RISCV/logger.

build_project riscv-fesvr --prefix=$RISCV/logger
build_project riscv-isa-sim --prefix=$RISCV/logger --with-fesvr=$RISCV/logger --with-isa=rv64imafd --enable-commitlog
CC= CXX= build_project riscv-pk --prefix=$RISCV/logger --host=riscv64-unknown-elf

mv $RISCV/logger/bin/spike $RISCV/logger/bin/lspike
echo "RISC-V Toolchain installation (with commit logging) completed!"
