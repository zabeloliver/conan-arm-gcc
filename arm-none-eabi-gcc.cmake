include(CMakeForceCompiler)

# this one is important
SET(CMAKE_SYSTEM_NAME GENERIC)
SET(CMAKE_SYSTEM_VERSION 1)

# specify the cross compiler
CMAKE_FORCE_C_COMPILER(arm-none-eabi-gcc GNU)
#CMAKE_FORCE_CXX_COMPILER(arm-none-eabi-g++ GNU)

# specify the cross compiler
SET(TOOL_PATH $ENV{TOOLCHAIN_PATH})
# For AR see here: https://itk.org/Bug/view.php?id=13038
# only needed for ASM
SET(CMAKE_AR "${TOOL_PATH}/bin/arm-none-eabi-ar.exe" CACHE FILEPATH "Archiver")
SET(CMAKE_C_COMPILER "${TOOL_PATH}/bin/arm-none-eabi-gcc.exe")
SET(CMAKE_CXX_COMPILER "${TOOL_PATH}/bin/arm-none-eabi-c++.exe")
SET(CMAKE_ASM_COMPILER "${TOOL_PATH}/bin/arm-none-eabi-as.exe")

# cyelf
SET(CYELF "${PROJECT_SOURCE_DIR}/toolchain/cyelf/cyelftool.exe")

# where is the target environment 
SET(CMAKE_FIND_ROOT_PATH  "${TOOL_PATH}")
include_directories("${TOOL_PATH}/arm-none-eabi/include/")
#include_directories("${TOOL_PATH}/lib/gcc/arm-none-eabi/4.9.3/include")


# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)


