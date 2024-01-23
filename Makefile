# Makefile for Ex1
# Compiler
CC = gcc
#Warrnings
CFLAGS= -c -Wall
#Source files
SRC= basicClassification.c advancedClassificationLoop.c
SRCR=  basicClassification.c advancedClassificationRecursion.c
#Header file
Header=NumClass.h
#OBJECT REF:
OBJECTLOOP=basicClassification.o advancedClassificationLoop.o
OBJECTREC=basicClassification.o advancedClassificationRecursion.o
#OBJECTS Compile:
OBJ: $(SRC) $(Header)
	$(CC)$(CFLAGS)	$(SRC) 
OBJR: $(SRCR) $(Header)
	$(CC)$(CFLAGS) $(SRCR)
	basicClassification.o: basicClassification.c $(Header)
	$(CC) $(CFLAGS) -c basicClassification.c
advancedClassificationLoop.o: advancedClassificationLoop.c $(Header)
	$(CC) $(CFLAGS) -c advancedClassificationLoop.c
advancedClassificationRecursion.o: advancedClassificationRecursion.c $(Header)
	$(CC) $(CFLAGS) -c advancedClassificationRecursion.c 
#Static librarys:
#loops library:
 loops: $(OBJECTLOOP)
	ar -rcs libclassloops.a $(OBJECTLOOP)
#Recursive library:
recursives: $(OBJECTREC)
	ar -rcs libclassrec.a $(OBJECTREC)
#Dynamic librarys:
#loopd library:
.PHONY: loopd
loopd:	$(OBJECTLOOP) 
	$(CC) $(OBJECTLOOP) -shared -o libclassloops.so 
#Recursive library:
recursived: libclassrec.so
libclassrec.so: $(OBJECTREC) 
	$(CC) $(OBJECTREC) -shared -o libclassrec.so  
#Make mains:
mains: mains recursives
	$(CC) -c main.c -o mains.o
	$(CC) -o mains mains.o -L. -lclassrec 
#Make maindloop
maindloop: loopd
	$(CC) -c main.c -o maindloop.o
	$(CC) -o maindloop maindloop.o -L. ./libclassloops.so
#make maindrec
maindrec: recursived
	$(CC) -c main.c -o maindrec.o
	$(CC) -o maindrec maindrec.o -L. ./libclassrec.so
main.o: main.c $(Header)
	$(CC) $(CFLAGS) -c main.c
#make all
.PHONY: all
all: mains loopd maindloop maindrec loops recursived recursives
#make clean
.PHONY: clean
clean:
	rm -f *.o
	rm -f *.a
	rm -f *.so
	rm -f mains
	rm -f loopd
	rm -f maindloop
	rm -f maindrec