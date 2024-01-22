CC = gcc
CFLAGS = -c -Wall
OBJECTS = advancedClassificationLoop.o advancedClassificationRecursion.o basicClassification.o
advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	$(CC) $(CFLAGS) advancedClassificationLoop.c
advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) $(CFLAGS) advancedClassificationRecursion.c
basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(CFLAGS) basicClassification.c
.PHONY: clean
clean:
	rm -f *.o

.PHONY: loops
loops: advancedClassificationLoop.o basicClassification.o
	ar rcs libclassloops.a advancedClassificationLoop.o basicClassification.o

.PHONY: loopd
loopd:
	$(CC) -c advancedClassificationLoop.c basicClassification.c -fPIC
	$(CC) advancedClassificationLoop.o basicClassification.o -shared -o libclassloops.so

.PHONY: recursives
recursives: advancedClassificationRecursion.o basicClassification.o
	ar rcs libclassrec.a advancedClassificationRecursion.o basicClassification.o

.PHONY: recursived
recursived:
	$(CC) -c advancedClassificationRecursion.c basicClassification.c -fPIC
	$(CC) advancedClassificationRecursion.o basicClassification.o -shared -o libclassrec.so

mains: recursives
	$(CC) -c main.c -o mains.o
	$(CC) -o mains mains.o -L -l_libclassrec

maindloop:
	$(CC) -c main.c -o maindloop.o -fPIC
	$(CC) -o maindloop maindloop.o -L -l_libclassloops


#main.o: main.c NumClass.h
#	gcc -c main.c
#main:
#	gcc advancedClassificationLoop.o advancedClassificationLoop.o basicClassification.o main.o


#.PHONY: all
#all:$(OBJECTS)
#
## Rule to build object files
#%.o: %.c
#	$(CC) $(CFLAGS) -c $< -o $@
