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
#Static librarys:
#loops library:
 loops: $(OBJECTLOOP)
	ar rcs libclassloops.a $(OBJECTLOOP)
#Recursive library:
recursives: $(OBJECTREC)
	ar rcs libclassrec.a $(OBJECTREC)
#Dynamic librarys:
#loopd library:
.PHONY: loopd
loopd:	$(OBJECTLOOP) 
	$(CC) -shared -o libclassloops.so $(OBJECTLOOP)
#Recursive library:
.PHONY: recursived
recursived: $(OBJECTREC) 
	$(CC) -shared -o libclassrec.so $(OBJECTREC) 
#Make mains:
mains:recursives 
	$(CC) -c main.c -o mains.o -fPIC -lavcodec
	$(CC) -o mains mains.o -L. -lclassrec
#Make maindloop
maindloop: loopd
	$(CC) -c main.c -o maindloop.o -fPIC -lavcodec
	$(CC) -o maindloop maindloop.o -L. -lclassloops 
#make maindrec
maindrec: recursived
	$(CC) -c main.c -o maindrec.o -fPIC -lavcodec
	$(CC) -o maindrec maindrec.o -L. -lclassrec
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