# CMakeKoans
Koans to learn CMake

Inspired by [RubyKoans](https://github.com/edgecase/ruby_koans) this is a way to learn CMake in small "unit-test" like steps. As they say:

  While walking the path to [[CMake]] enlightenment you will need to run the koan and see it fail (red), make the test pass (green), then take a moment and reflect upon the test to see what it is teaching you and improve the code to better communicate its intent (refactor).

###Requirements
You will need [CMake](http://cmake.org/).

##How to walk the path to enlightment
1. Get the sources

        git clone git://github.com/tibonihoo/CMakeKoans

2. Create a build directory

        cd CMakeKoans
        mkdir build
        cd build

3. Run CMake and follow the instructions

        cmake ..

Contrary to a typical CMake based workflow, there is no need here to open the generated files.

You will need to edit CMakeLists files to fullfill a koan and then run `cmake` again.

Thus, walking the path to enlightment is a repetition of these steps:

1. Edit and save a CMakeLists

2. Run `cmake`

3. Read the master's reply

##Licence
CC0 1.0 Universal (see accompanying LICENSE file)
