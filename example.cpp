#include <iostream>
#include <chrono>
#include <thread>
#include <cstdint>

#include <tudocomp_stat/StatPhase.hpp>

#include <example.hpp>

int main (int argc, char *argv[]) {
    // needed for arcane linker reasons
    // (might be hidden in future versions of the library)
    free(malloc(42));

    tdc::StatPhase root("root_phase");
    {
        std::vector<uint8_t> v(MiB, 0xff);

        // we print the addresses to ensure the
        // compiler does not optimize out the allocation
        std::cout << "allocation: " << (void*)&v.front() << " - " << (void*)&v.back() << "\n";
        std::this_thread::sleep_for(std::chrono::milliseconds(1000));

        {
            tdc::StatPhase sub("subphase_1");
            std::vector<uint8_t> w(MiB * 10ull, 0xff);

            std::cout << "allocation: " << (void*)&w.front() << " - " << (void*)&w.back() << "\n";
            std::this_thread::sleep_for(std::chrono::milliseconds(1000));
        }
        {
            tdc::StatPhase sub("subphase_2");
            subfunction();
        }
    }

    std::cout << "Output of the measured phases as json:\n";
    std::cout << root.to_json().dump(4) << "\n";
}
