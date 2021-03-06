
TARGET	=	tiramisu
SRC		:=	tiramisu.c callbacks.c format.c

PREFIX ?=	/usr/local

CFLAGS	=	-Wall
IFLAGS  =	$(shell pkg-config --cflags glib-2.0 gio-2.0)
LFLAGS	=	$(shell pkg-config --libs glib-2.0 gio-2.0)

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) $(IFLAGS) $(SRC) $(LFLAGS) -o $(TARGET)

install: $(TARGET)
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	install $(TARGET) $(DESTDIR)$(PREFIX)/bin/$(TARGET)

clean:
	$(RM) ./tiramisu
