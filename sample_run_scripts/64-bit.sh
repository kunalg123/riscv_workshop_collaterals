riscv64-unknown-elf-gcc -I./env -I./common -I./mt-vvadd -DPREALLOCATE=1 -mcmodel=medany -static -std=gnu99 -O2 -ffast-math -fno-common -fno-builtin-printf -o mt-vvadd.riscv_v2 ./mt-vvadd/mt-vvadd.c ./mt-vvadd/vvadd.c ./common/syscalls.c ./common/crt.S -static -nostdlib -nostartfiles -lm -lgcc -T ./common/test.ld
riscv64-unknown-elf-objdump --disassemble-all --disassemble-zeroes --section=.text --section=.text.startup --section=.text.init --section=.data mt-vvadd.riscv_v2  > mt-vvadd.riscv_v2.dump
spike --isa=rv64gc mt-vvadd.riscv > mt-vvadd.riscv_v2.out
