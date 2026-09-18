GNAT    := gnatmake
# -gnata enables assertion policy / contract checks at run time
FLAGS   := -gnata -gnatwa -gnat2022
OBJ_DIR := obj
BIN_DIR := bin

.PHONY: all test clean

all: $(BIN_DIR)/tests

$(BIN_DIR)/tests: *.ads *.adb *.gpr
	mkdir -p $(OBJ_DIR) $(BIN_DIR)
	$(GNAT) $(FLAGS) -Pcontracts_topic.gpr

test: all
	@echo "Running tests..."
	@$(BIN_DIR)/tests

clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)
