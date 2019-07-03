GCC = g++
CFLAGS = -I include/
LDFLAGS = 

PROGRAM = test

ODIR = obj
BIN = bin
IDIR = src

OUT = $(BIN)/$(PROGRAM)

all: $(IDIR) $(ODIR) $(BIN) $(OUT)

run: all
	./$(BIN)/$(PROGRAM)
$(ODIR):
	mkdir $(ODIR)
$(BIN):
	mkdir $(BIN)
$(IDIR):
	mkdir $(IDIR)

C_SOURCES = $(shell find $(IDIR) -type f -name *.cpp -printf "%f\n")
OBJECTS = $(patsubst %.cpp, $(ODIR)/%.o,$(C_SOURCES))

$(ODIR)/%.o : $(IDIR)/%.cpp
	$(GCC) $(CFLAGS) -c $^ -o $@

$(OUT): $(OBJECTS)
	$(GCC) $(LDFLAGS) -o $(BIN)/$(PROGRAM) $(OBJECTS)

clean: $(ODIR) $(BIN)
	rm -rf $(ODIR)
	rm -rf $(BIN)
