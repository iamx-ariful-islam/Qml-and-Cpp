cmake_minimum_required(VERSION 3.16)

project(QtQuickSimpleSqliteUserInfProject VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick Sql) # add "Sql" for sqlite database

qt_standard_project_setup()

qt_add_executable(appQtQuickSimpleSqliteUserInfProject
    main.cpp
)

qt_add_qml_module(appQtQuickSimpleSqliteUserInfProject
    URI QtQuickSimpleSqliteUserInfProject
    VERSION 1.0
    QML_FILES Main.qml
    QML_FILES CustomNotification.qml
    SOURCES databasemanager.hpp databasemanager.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appQtQuickSimpleSqliteUserInfProject PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appQtQuickSimpleSqliteUserInfProject
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appQtQuickSimpleSqliteUserInfProject
    PRIVATE Qt6::Quick Qt6::Sql # add "Qt6::Sql" for sqlite database
)

include(GNUInstallDirs)
install(TARGETS appQtQuickSimpleSqliteUserInfProject
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
