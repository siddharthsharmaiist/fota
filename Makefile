#Makefile for FOTA
CC = gcc
CFLAGS = -Wall -Wconversion -Wsign-conversion -c -g 
LDFLAGS = -shared -fPIC

CONFIGLOC = lib/config
HTTPLOC =lib/http
FOTALOC = fota
PARSONLOC = 3rdparty/parson

TARGETS = $(CONFIGLOC)/config.c $(HTTPLOC)/http.c $(HTTPLOC)/https.c $(HTTPLOC)/request.c $(HTTPLOC)/response.c $(PARSONLOC)/parson.c $(FOTALOC)/fota.c $(FOTALOC)/api.c

OBJECTS = $(TARGETS:.c=.o)

#LIB = fotalib.so

all: $(OBJECTS) $(LIB) libfota.a

libfota.a: $(OBJECTS)
	ar -rc libfota.a $(OBJECTS)

#$(LIB): $(OBJECTS)
#	$(CC) -shared $(OBJECTS) -o $(LIB)

config.o: $(CONFIGLOC)/config.c $(CONFIGLOC)/config.h
	$(CC) $(CFLAGS) $(CONFIGLOC)/config.c

http.o: $(HTTPLOC)/http.c $(HTTPLOC)/http.h
	$(CC) $(CFLAGS) $(HTTPLOC)/http.c

https.o: $(HTTPLOC)/https.c $(HTTPLOC)/https.h
	$(CC) $(CFLAGS) $(HTTPLOC)/https.c

request.o: $(HTTPLOC)/request.c $(HTTPLOC)/request.h
	$(CC) $(CFLAGS) $(HTTPLOC)/request.c

response.o: $(HTTPLOC)/response.c $(HTTPLOC)/response.h
	$(CC) $(CFLAGS) $(HTTPLOC)/response.c

parson.o: $(PARSONLOC)/parson.c $(PARSONLOC)/parson.h
	$(CC) $(CFLAGS) $(PARSONLOC)/parson.c

fota.o: $(FOTALOC)/fota.c $(FOTALOC)/fota.h
	$(CC) $(CFLAGS) $(FOTALOC)/fota.c

api.o: $(FOTALOC)/api.c $(FOTALOC)/fota.h
	$(CC) $(CFLAGS) $(FOTALOC)/api.c

#response.o: response.c response.h
#	gcc -c response.c
clean:
	rm -f *.o $(TARGETS:.c=.o) libfota.a
