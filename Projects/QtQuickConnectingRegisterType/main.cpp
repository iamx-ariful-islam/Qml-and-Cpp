#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <backend.h>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    qmlRegisterType<Backend>("myBackend", 1, 0, "MyBackend");

    const QUrl url(u"qrc:/QtQuickConnectingRegisterType/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
