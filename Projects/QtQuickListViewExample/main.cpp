#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <filemanagebackend.hpp>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    qmlRegisterType<FileManageBackend>("fileManageBackend", 0, 1, "FileManageBackend");

    const QUrl url(u"qrc:/QtQuickListViewExample/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
