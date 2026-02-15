cppsrc = $(wildcard source/*.cpp) \
	        $(wildcard source/Daina/*.cpp) \
		        $(wildcard source/Daina/Scanner/*.cpp) \
		        $(wildcard source/Daina/Token/*.cpp) \
		        $(wildcard source/Daina/AST/*.cpp) \
			$(wildcard source/Daina/Zither/*.cpp)
obj = $(cppsrc:.cpp=.o)


INCLUDE_FLAGS = -std=c++11  -I./source -I./source/Daina -I./source/Daina/Token -I./source/Daina/AST -I./source/Daina/Scanner -I./source/Daina/Zither


LDFLAGS = -pthread

CXXFLAGS = $(INCLUDE_FLAGS)

daina: $(obj)
	    $(CXX) -o $@ $^ $(LDFLAGS)


clean: 
	rm -f $(obj) daina

