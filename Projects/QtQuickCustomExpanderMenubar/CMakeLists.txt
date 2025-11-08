cmake_minimum_required(VERSION 3.16)

project(QtQuickCustomExpanderMenubar VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appQtQuickCustomExpanderMenubar
    main.cpp
)

qt_add_qml_module(appQtQuickCustomExpanderMenubar
    URI QtQuickCustomExpanderMenubar
    VERSION 1.0
    QML_FILES Main.qml
    QML_FILES CustomExpanderMenubar.qml
    RESOURCES images/close.png images/close_2.png images/close_3.png images/menu_1.png images/menu_2.png images/down-arrow.png
    RESOURCES images/lock.png images/turn-off.png images/user.png
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appQtQuickCustomExpanderMenubar PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appQtQuickCustomExpanderMenubar
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appQtQuickCustomExpanderMenubar
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appQtQuickCustomExpanderMenubar
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
