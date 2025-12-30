VBCC_ROOT ?= $(VBCC)
CC ?= vc
ifneq ($(VBCC_ROOT),)
ifneq ($(wildcard $(VBCC_ROOT)/bin/vc),)
CC := $(VBCC_ROOT)/bin/vc
endif
endif
TARGET ?= kick13
CFLAGS ?= +$(TARGET) -O2
NDK ?= $(HOME)/Amiga/NDK_1.3
NDK_INC ?= $(NDK)/Includes1.3/include.h
CFLAGS += -I$(NDK_INC)
LDFLAGS ?=
LIBS ?= -lamiga -lmsoft

SRC = amicalc.c
OUT = amicalc

.PHONY: all clean

all: $(OUT)

$(OUT): $(SRC)
	VBCC=$(VBCC_ROOT) $(CC) $(CFLAGS) -o $(OUT) $(SRC) $(LDFLAGS) $(LIBS)

clean:
	rm -f $(OUT)
