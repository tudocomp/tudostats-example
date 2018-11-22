#include <iostream>
#include <chrono>
#include <thread>
#include <cstdint>

constexpr uint64_t MiB = 1024ull * 1024ull;

inline void subfunction() {
    std::vector<uint8_t> v(42ull * MiB, 0xff);

    // we print the addresses to ensure the
    // compiler does not optimize out the allocation
    std::cout << "allocation: " << (void*)&v.front() << " - " << (void*)&v.back() << "\n";
    std::this_thread::sleep_for(std::chrono::milliseconds(1000));
}
