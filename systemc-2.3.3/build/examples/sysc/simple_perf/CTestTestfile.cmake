# CMake generated Testfile for 
# Source directory: /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/simple_perf
# Build directory: /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/simple_perf
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(examples/sysc/simple_perf/simple_perf "/usr/bin/cmake" "-DTEST_EXE=/home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/simple_perf/simple_perf" "-DTEST_DIR=/home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/simple_perf" "-DTEST_INPUT=" "-DTEST_GOLDEN=" "-DTEST_FILTER=" "-DDIFF_COMMAND=/usr/bin/diff" "-DDIFF_OPTIONS=-u" "-P" "/home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/cmake/run_test.cmake")
set_tests_properties(examples/sysc/simple_perf/simple_perf PROPERTIES  FAIL_REGULAR_EXPRESSION "^[*][*][*]ERROR" _BACKTRACE_TRIPLES "/home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/CMakeLists.txt;137;add_test;/home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/simple_perf/CMakeLists.txt;44;configure_and_add_test;/home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/simple_perf/CMakeLists.txt;0;")
