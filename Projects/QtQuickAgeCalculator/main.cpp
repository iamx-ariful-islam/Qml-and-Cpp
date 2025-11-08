#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QQmlContext>
#include <calculator.hpp>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<Calculator>("myBackend", 0, 1, "MyBackend");


    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("QtQuickAgeCalculator", "Main");

    return app.exec();
}
