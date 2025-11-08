cmake_minimum_required(VERSION 3.16)

project(QtQuickInfoPageDesign VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appQtQuickInfoPageDesign
    main.cpp
)

qt_add_qml_module(appQtQuickInfoPageDesign
    URI QtQuickInfoPageDesign
    VERSION 1.0
    QML_FILES Main.qml
    RESOURCES icons/analyzers/agappe.ico icons/analyzers/biobase.ico icons/analyzers/dymind.ico icons/analyzers/excbio.ico icons/analyzers/genrui.ico icons/analyzers/mindray.ico icons/analyzers/rayto.ico
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appQtQuickInfoPageDesign PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appQtQuickInfoPageDesign
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appQtQuickInfoPageDesign
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appQtQuickInfoPageDesign
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
