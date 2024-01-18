CC = gcc
CFLAGS = -Wall
OBJECTS = advancedClassificationLoop.o advancedClassificationRecursion.o basicClassification.o
advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	gcc -c advancedClassificationLoop.c
advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	gcc -c advancedClassificationLoop.c
basicClassification.o: basicClassification.c NumClass.h
	gcc -c advancedClassificationLoop.c
main:
	gcc advancedClassificationLoop.o advancedClassificationLoop.o basicClassification.o
.PHONY: clean
clean:
	rm -f *.o
#.PHONY: all
#all:$(OBJECTS)

# Rule to build object files
#%.o: %.c
#	$(CC) $(CFLAGS) -c $< -o $@
