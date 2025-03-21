# Compiler
COBOL = cobc

# Compiler flags
FLAGS = -Fx

# Output executable
OUTPUT = main

# Source files
SRCS = main.cob display.cob roll.cob roll-test.cob dice.cob gameplay.cob file-write.cob file-read.cob

# Default target
all: $(OUTPUT)

# Build the executable
$(OUTPUT): $(SRCS)
	$(COBOL) $(FLAGS) -o $(OUTPUT) $(SRCS)

# Clean up compiled files
clean:
	rm -f $(OUTPUT) *.so *.o
