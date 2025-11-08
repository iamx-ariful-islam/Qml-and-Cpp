cmake_minimum_required(VERSION 3.16)

project(QtQuickSQLiteExample VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick Sql) # add Sql this for database connection

qt_standard_project_setup()

qt_add_executable(appQtQuickSQLiteExample
    main.cpp
)

qt_add_qml_module(appQtQuickSQLiteExample
    URI QtQuickSQLiteExample
    VERSION 1.0
    QML_FILES Main.qml
    SOURCES databasemanager.hpp databasemanager.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appQtQuickSQLiteExample PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appQtQuickSQLiteExample
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appQtQuickSQLiteExample
    PRIVATE Qt6::Quick Qt6::Sql # add Qt6::Sql this for database connection
)

include(GNUInstallDirs)
install(TARGETS appQtQuickSQLiteExample
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
