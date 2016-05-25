# CMakeKoans

Koans to learn CMake

Inspired by [RubyKoans](https://github.com/edgecase/ruby_koans) this is a way to learn CMake in small "unit-test" like steps. As they say:

> While walking the path to [CMake] enlightenment you will need to run the koan and see it fail (red), make the test pass (green), then take a moment and reflect upon the test to see what it is teaching you and improve the code to better communicate its intent (refactor).

If you're looking for a "how to start with CMake" documentation, you can first have a look at [CMake's tutorial](https://cmake.org/cmake-tutorial/).


##Requirements

You will need [CMake](http://cmake.org/).

You will also need the proper tools to build C++ code on your machine (be it make, llvm, gcc, Xcode, Visual Studio etc).


##How to walk the path to enlightment

1. Get the sources

        git clone git://github.com/tibonihoo/CMakeKoans

2. Create a build directory

        cd CMakeKoans
        mkdir build
        cd build

3. Use CMake to generate the koan project

        cmake ..

4. Use CMake "build" command to run the koans

        cmake --build .


You will need to edit CMakeLists files inside the `koans` to fullfill a koan and then run `cmake --build .` and again.

Thus, walking the path to enlightment is a repetition of these steps:

1. Edit and save a CMakeLists

2. Run `cmake --build .`

3. Read the master's reply

##License

CC0 1.0 Universal (see accompanying LICENSE file)
