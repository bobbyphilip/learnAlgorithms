CFLAGS = -g -Wall -I.
CC = gcc
all: sort_driver util_tester string_rotate fibonacci

DEBUG	?=n
ifeq ($(DEBUG),y)
	CFLAGS += -DDEBUG
endif


sort_driver: sort_driver.o sorter.o util.o
	$(CC) $(CFLAGS) -o sort_driver sort_driver.o sorter.o util.o

util_tester: util_tester.o util.o
	$(CC) $(CFLAGS) -o util_tester util_tester.o util.o

string_rotate: string_rotate.o util.o
	$(CC) $(CFLAGS) -o string_rotate string_rotate.o util.o

sort_driver.o: sort_driver.c
	$(CC) $(CFLAGS) -c sort_driver.c

sorter.o: sorter.c sorter.h
	$(CC) $(CFLAGS) -c sorter.c

util.o: util.c util.h
	$(CC) $(CFLAGS) -c util.c

util_tester.o: util_tester.c 
	$(CC) $(CFLAGS) -c util_tester.c

fibonacci: fibonacci.c 
	$(CC) $(CFLAGS) -o fibonacci fibonacci.c


clean:  clean_sorter clean_util clean_sort_driver clean_util_tester clean_string_rotate clean_fibonacci

clean_sorter:
	rm -f sorter.o

clean_util:
	rm -f util.o

clean_sort_driver:
	rm -f sort_driver.o
	rm -f sorter.o
	rm -f util.o
	rm -f sort_driver

clean_util_tester:
	rm -f util_tester.o
	rm -f util_tester

clean_string_rotate:
	rm -f string_rotate.o
	rm -f string_rotate

clean_fibonacci:
	rm -f fibonacci.o
	rm -f fibonacci
