driver: baseline.o co_zkw.o driver.o 
	g++ driver.o baseline.o co_zkw.o -o driver -O2 -std=c++11 

baseline.o: baseline.cpp
	g++ baseline.cpp -o baseline.o -c -O2 -std=c++11 
co_zkw.o: co_zkw.cpp
	g++ co_zkw.cpp -o co_zkw.o -O2 -c -std=c++11 
driver.o: driver.cpp
	g++ driver.cpp -o driver.o -O2 -c -std=c++11 

clean:
	rm *.o
	rm driver
