//
//  AsymSync.hpp
//  DainaCompiler
//
//  Created by SamWit on 18/12/2016.
//  Copyright © 2016 Samuel Whitton. All rights reserved.
//






#ifndef AsymSync_hpp
#define AsymSync_hpp



//version using queue as buffer****************

#include <iostream>
#include <queue>
#include <mutex>

namespace Daina {
    
    template<class E> class AsymSync {
    private:
        AsymSync<E>();
        
        std::queue<E> eQueue;

        std::mutex senderMutex;
        std::mutex receiverMutex;
        std::mutex interMutex;
        
        bool senderInit;
        bool receiverInit;

    public:
        static AsymSync<E>* newAsymSync();
        static void deleteAsymSync(AsymSync<E> *sync);
        
        void send(E e);
        E receive();
        
        void syncSender();
        void syncReceiver();

        void waitForCompletion();
    };
    
}


#include <chrono>
#include <thread>


namespace Daina {
    
    template<class E> AsymSync<E>::AsymSync() {
        this->eQueue = std::queue<E>();
        this->receiverInit = false;
        this->senderInit = false;
    }
    
    template<class E> AsymSync<E>* AsymSync<E>::newAsymSync() {
        return new AsymSync<E>();
    }
    
    template<class E> void AsymSync<E>::deleteAsymSync(AsymSync<E> *sync) {
        delete sync;
    }
    
    template<class E> void AsymSync<E>::send(E e) {
        int maximumBuffer = 9874;
        while (this->eQueue.size()>maximumBuffer) {
            std::this_thread::sleep_for(std::chrono::milliseconds(10));
        }
        interMutex.lock();
        this->eQueue.push(e);
        interMutex.unlock();
    }
    
    template<class E> E AsymSync<E>::receive() {
        while (this->eQueue.empty()) {
            std::this_thread::sleep_for(std::chrono::milliseconds(10));
        }
        interMutex.lock();
        E sentE = this->eQueue.front();
        this->eQueue.pop();
        interMutex.unlock();
        return sentE;
    }
    
    template<class E> void AsymSync<E>::syncSender() {
        senderInit = true;
        while (!receiverInit) std::this_thread::sleep_for(std::chrono::milliseconds(7));
    }
    
    template<class E> void AsymSync<E>::syncReceiver() {
        receiverInit = true;
        while (!senderInit) std::this_thread::sleep_for(std::chrono::milliseconds(7));
    }
    
}




//Version using mutex locks to have only a single char buffer****************
/*



#include <mutex>
#include <iostream>

namespace Daina {
    
    template<class E> class AsymSync {
    private:
        AsymSync<E>();
        
        E e;
        std::mutex senderMutex;
        std::mutex receiverMutex;
        std::mutex interMutex;
        
        bool senderInit;
        bool receiverInit;
    public:
        static AsymSync<E>* newAsymSync();
        static void deleteAsymSync(AsymSync<E> *sync);
        
        void send(E e);
        E receive();
        
        void syncSender();
        void syncReceiver();
    };
    
}


#include <chrono>
#include <thread>


namespace Daina {
    
    template<class E> AsymSync<E>::AsymSync() {
        this->receiverInit = false;
        this->senderInit = false;
    }
    
    template<class E> AsymSync<E>* AsymSync<E>::newAsymSync() {
        return new AsymSync<E>();
    }
    
    template<class E> void AsymSync<E>::deleteAsymSync(AsymSync<E> *sync) {
        delete sync;
    }
    
    template<class E> void AsymSync<E>::send(E e) {
        receiverMutex.lock();
        this->e = e;
        senderMutex.unlock();
        interMutex.lock();
        receiverMutex.unlock();
        senderMutex.lock();
        interMutex.unlock();
    }
    
    template<class E> E AsymSync<E>::receive() {
        receiverMutex.unlock();
        senderMutex.lock();
        interMutex.unlock();
        E sentE = this->e;
        receiverMutex.lock();
        senderMutex.unlock();
        interMutex.lock();
        return sentE;
    }
    
    template<class E> void AsymSync<E>::syncSender() {
        senderMutex.lock();
        senderInit = true;
        while (!receiverInit) std::this_thread::sleep_for(std::chrono::milliseconds(7));
    }
    
    template<class E> void AsymSync<E>::syncReceiver() {
        receiverMutex.lock();
        interMutex.lock();
        receiverInit = true;
        while (!senderInit) std::this_thread::sleep_for(std::chrono::milliseconds(7));
    }
    
}


*/

#endif /* AsymSync_hpp */


