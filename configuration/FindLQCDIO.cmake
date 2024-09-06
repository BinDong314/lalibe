# FindLQCDIO.cmake - Locate the LQCDIO header files

# Allow the user to specify the directory where LQCDIO is located
if(NOT LQCDIO_DIR AND NOT LQCDIO_ROOT)
    set(LQCDIO_ROOT "$ENV{LQCDIO_DIR}")
endif()

# Locate the header files
find_path(LQCDIO_INCLUDE_DIR
    NAMES lqcdio.h  # Replace with an actual header file name from the LQCDIO library
    PATHS ${LQCDIO_DIR}/include ${LQCDIO_ROOT}/include
    PATH_SUFFIXES include
)

# Check if the headers are found
if(LQCDIO_INCLUDE_DIR)
    set(LQCDIO_FOUND TRUE)
else()
    set(LQCDIO_FOUND FALSE)
endif()

# Mark the found paths as advanced to hide them from the user in CMake GUI
mark_as_advanced(LQCDIO_INCLUDE_DIR)

# Provide the package configuration
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LQCDIO REQUIRED_VARS LQCDIO_INCLUDE_DIR VERSION_VAR LQCDIO_VERSION)

# Define the target if found
if(LQCDIO_FOUND)
    set(LQCDIO_INCLUDE_DIRS ${LQCDIO_INCLUDE_DIR})

    # Create an imported interface target
    add_library(LQCDIO::LQCDIO INTERFACE IMPORTED)
    set_target_properties(LQCDIO::LQCDIO PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES ${LQCDIO_INCLUDE_DIR}
    )
endif()
