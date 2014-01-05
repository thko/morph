TARGET = morph

HC = ghc
CFLAGS = -Wall
HFILES = Morphemes.hs Main.hs
IFILES = $(HFILES:.hs=.hi)
OFILES = $(HFILES:.hs=.o)

default: $(TARGET)

clean:
	rm -rf $(IFILES) $(OFILES) $(TARGET)

$(TARGET): $(HFILES)
	$(HC) $(CFLAGS) $(HFILES) -o $(TARGET)
