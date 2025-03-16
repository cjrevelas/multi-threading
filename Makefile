# Compiler and flags (-pthread ensures proper linking with the POSIX threads library)
CC = gcc
CFLAGS = -pthread

# Executable targets
STATIC_EXE = main_static
DYNAMIC_EXE = main_dynamic

# Source files
SRC = main.c

# Static linkink with pthreads library
# -static forces static linking in main_static
$(STATIC_EXE): $(SRC)
	$(CC) $(CFLAGS) -static -o $(STATIC_EXE) $(SRC) -lpthread

# Dynamic linking with pthreads library (default)
# the default main_dynamic links dynamically with libpthread.so
$(DYNAMIC_EXE): $(SRC)
	$(CC) $(CFLAGS) -o $(DYNAMIC_EXE) $(SRC) -lpthread

clean:
	rm -f $(STATIC_EXE) $(DYNAMIC_EXE)
