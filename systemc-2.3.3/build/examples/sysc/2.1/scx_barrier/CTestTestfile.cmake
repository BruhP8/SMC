# CMake generated Testfile for 
# Source directory: /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/2.1/scx_barrier
# Build directory: /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/2.1/scx_barrier
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(examples/sysc/2.1/scx_barrier/scx_barrier "/usr/bin/cmake" "-DTEST_EXE=/home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/2.1/scx_barrier/scx_barrier" "-DTEST_DIR=/home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/2.1/scx_barrier" "-DTEST_INPUT=" "-DTEST_GOLDEN=/home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/2.1/scx_barrier/golden.log" "-DTEST_FILTER=" "-DDIFF_COMMAND=/usr/bin/diff" "-DDIFF_OPTIONS=-u" "-P" "/home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/cmake/run_test.cmake")
set_tests_properties(examples/sysc/2.1/scx_barrier/scx_barrier PROPERTIES  FAIL_REGULAR_EXPRESSION "^[*][*][*]ERROR" _BACKTRACE_TRIPLES "/home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/CMakeLists.txt;137;add_test;/home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/2.1/scx_barrier/CMakeLists.txt;44;configure_and_add_test;/home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/2.1/scx_barrier/CMakeLists.txt;0;")