CXXFLAGS=
LDLIBS=
CC=g++

PROGRAM=main
OBJS=

all: $(PROGRAM)

$(PROGRAM): $(PROGRAM).o $(OBJS)
$(PROGRAM).o:

clean:
	$(RM) -v $(PROGRAM) *.o

test:
	./$(PROGRAM)

debug: CXXFLAGS += -g
debug: clean $(PROGRAM)

