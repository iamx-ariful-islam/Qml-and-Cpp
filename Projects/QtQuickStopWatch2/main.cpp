#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QQmlContext>
#include <stopwatch.hpp>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<Stopwatch>("myStopwatch", 0, 1, "MyStopwatch");


    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("QtQuickStopWatch2", "Main");

    return app.exec();
}
