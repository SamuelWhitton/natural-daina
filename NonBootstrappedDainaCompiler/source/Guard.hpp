//
//  Guard.h
//  DainaCompiler
//
//  Created by SamWit on 18/12/2016.
//  Copyright © 2016 Samuel Whitton. All rights reserved.
//

#ifndef Guard_h
#define Guard_h

#include <assert.h>
#include <iostream>


#define guard(condition) \
if (!(condition)) { \
std::cout << "Internal Guard Condition Failure\n"; \
assert(condition); \
}

#endif /* Guard_h */
