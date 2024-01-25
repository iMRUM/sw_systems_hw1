# Makefile for Ex1
# Compiler
CC = gcc

#Warrnings
CFLAGS= -g -Wall

#Source files
SRC= basicClassification.c advancedClassificationLoop.c
SRCR=  basicClassification.c advancedClassificationRecursion.c

#Header file
Header=NumClass.h

#OBJECT REF:
OBJECTLOOP=basicClassification.o advancedClassificationLoop.o
OBJECTREC=basicClassification.o advancedClassificationRecursion.o

#OBJECTS Compile:
basicClassification.o: basicClassification.c $(Header)
	$(CC) $(CFLAGS) -c basicClassification.c
advancedClassificationLoop.o: advancedClassificationLoop.c $(Header)
	$(CC) $(CFLAGS) -c advancedClassificationLoop.c
advancedClassificationRecursion.o: advancedClassificationRecursion.c $(Header)
	$(CC) $(CFLAGS) -c advancedClassificationRecursion.c 

#Main creating 
main.o: main.c $(Header)
	$(CC) $(CFLAGS) -c main.c

#Static librarys:
#Create the loop library:
 loops: libclassloops.a
 #Create the library with OBJECTLOOP
 libclassloops.a: $(OBJECTLOOP)
	ar rcs libclassloops.a $(OBJECTLOOP)

#Create the recursive library:
recursives: libclassrec.a
#Create the library with OBJECTREC
libclassrec.a: $(OBJECTREC)
	 ar rcs libclassrec.a $(OBJECTREC)

#Dynamic librarys:
#Create the dynamic loop library
loopd:libclassloops.so
#Create the dynamic loop library using OBJECTLOOP
libclassloops.so: $(OBJECTLOOP)
	$(CC) -shared -fpic -o libclassloops.so $(OBJECTLOOP) 

#Create the recursive dynamic library
recursived:libclassrec.so
#Create the dynamic recursive library using OBJECTREC
libclassrec.so: $(OBJECTREC) 
	$(CC) -shared -fpic -o libclassrec.so  $(OBJECTREC)

#Create mains
mains: main.o libclassrec.a
	$(CC) $(CFLAGS) main.o ./libclassrec.a -o mains

#Create maindloop
maindloop: libclassloops.so
		$(CC) $(CFLAGS) main.o ./libclassloops.so -o maindloop

#Create maindrec
maindrec: libclassrec.so
	$(CC) $(CFLAGS) main.o ./libclassrec.so -o maindrec

#Create all
.PHONY: all
all: mains loopd maindloop maindrec loops recursived recursives

.PHONY: clean
clean:
	rm -f *.o
	rm -f *.a
	rm -f *.so
	rm -f mains
	rm -f loopd
	rm -f maindloop
	rm -f maindrec