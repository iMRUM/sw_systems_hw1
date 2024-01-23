CC = gcc
CFLAGS = -c -Wall
OBJECTS = advancedClassificationLoop.o advancedClassificationRecursion.o basicClassification.o
advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	$(CC) $(CFLAGS) advancedClassificationLoop.c
advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) $(CFLAGS) advancedClassificationRecursion.c
basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(CFLAGS) basicClassification.c
libclassloops.a: advancedClassificationLoop.o basicClassification.o
	ar rcs libclassloops.a advancedClassificationLoop.o basicClassification.o
libclassrec.so: advancedClassificationRecursion.o basicClassification.o
	$(CC) advancedClassificationRecursion.o basicClassification.o -shared -o libclassrec.so
.PHONY: clean
clean:
	rm -f *.o
	rm -f *.so
	rm -f *.a

.PHONY: loops
loops: libclassloops.a
	ar rcs libclassloops.a advancedClassificationLoop.o basicClassification.o

.PHONY: loopd
loopd:
	$(CC) advancedClassificationLoop.o basicClassification.o -shared -o libclassloops.so

.PHONY: recursives
recursives: advancedClassificationRecursion.o basicClassification.o
	ar rcs libclassrec.a advancedClassificationRecursion.o basicClassification.o

.PHONY: recursived
recursived: libclassrec.so
	$(CC) advancedClassificationRecursion.o basicClassification.o -shared -o libclassrec.so

mains: recursives mains
	$(CC) -c main.c -o mains.o
	$(CC) -o mains mains.o -L. -lclassrec
maindloop: loopd
	$(CC) -c main.c -o maindloop.o
	$(CC) -o maindloop maindloop.o -L. ./libclassloops.so
maindrec: recursived
	$(CC) -c main.c -o maindrec.o
	$(CC) -o maindrec maindrec.o -L. ./libclassrec.so


.PHONY: all
all: $(OBJECTS) mains maindloop maindrec
	$(CC) $(CFLAGS) $?

