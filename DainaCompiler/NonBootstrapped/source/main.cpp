//
//  main.cpp
//  DainaCompiler
//
//  Created by SamWit on 11/12/2016.
//  Copyright © 2016 Samuel Whitton. All rights reserved.
//

#include <iostream>
#include <fstream>

#include "Daina.hpp"



int main(int argc, const char * argv[]) {
    
    if (argc < 3) {
        std::cerr << "Usage: " << argv[0] << " COMPILATION_OUTPUT_FILE INPUT_DAINA_FILES\n";
        return 1;
    }
    
    std::cout << "Starting Daina Compilation\n";
    
    std::ofstream compOutFile(argv[1]);
    if (!compOutFile.is_open()) {
        std::cout << "Could not open output file: " << argv[1] << "\n";
        return 1;
    }
    
    Daina::Daina *daina = Daina::Daina::newDaina(Daina::OutputDelegate([](std::string msg) {
        std::cout << msg;
    }, [&compOutFile](std::string data) {
        compOutFile << data;
    }));
    
    //pull input
    char c;
    for (int i = 2; i < argc; ++i) {
        std::ifstream inFile(argv[i]);
        if (!inFile.is_open()) {
            std::cout << "Could not open input file: " << argv[i] << "\n";
            return 1;
        }
        daina->nextFile(std::string(argv[i]));
        std::cout << "parsing file: " << argv[i] << "...\n";
  	
        while (inFile.good()) {
            inFile.read(&c, 1);
            daina->nextChar(c);
        }
        
        inFile.close();
    }
    
    std::cout << "compiling into: " << argv[1] << "...\n";
    daina->compile();
    compOutFile.close();
    
    Daina::Daina::deleteDaina(daina);
    
    std::cout << ".\n";
    return 0;
}



