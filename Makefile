CFLAGS = -Wall -g

CORE_OBJ =		core/cpu.o \
				core/tables.o \
				core/execute.o \
				core/mem_loader.o \
				core/load.o \
				core/exchange.o \
				core/block_transfer.o \
				core/search.o \
				core/alu.o \
				core/misc.o \
				core/arithm16.o \
				core/rot_shift.o

TEST_OBJ =		test/test.o \
				test/cpu_suite.o \
				test/load_8bit_suite.o \
				test/load_16bit_suite.o \
				test/exchange_suite.o \
				test/block_suite.o \
				test/search_suite.o \
				test/add_suite.o \
				test/adc_suite.o \
				test/sub_suite.o \
				test/sbc_suite.o \
				test/bitwise_suite.o \
				test/cp_suite.o \
				test/inc_dec_suite.o \
				test/misc_suite.o \
				test/arithm_16bit_suite.o \
				test/rot_shift_suite.o

TEST_LFLAGS =	-lcunit
TEST_BIN =		test/test

.PHONY: all
all: test

test: $(TEST_OBJ) $(CORE_OBJ)
	$(CC) $(CFLAGS) $(TEST_OBJ) $(CORE_OBJ) -o $(TEST_BIN) $(TEST_LFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean-core
clean-core:
	rm -f $(CORE_OBJ)

.PHONY: clean-test
clean-test:
	rm -f $(TEST_OBJ) $(TEST_BIN)

.PHONY: clean
clean: clean-test clean-core
