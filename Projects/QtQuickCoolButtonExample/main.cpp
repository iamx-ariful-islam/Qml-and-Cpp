#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <exampleclass.h>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType< ExampleClass >("Monty", 1, 0, "ExampleClass" );


    const QUrl url(u"qrc:/QtQuickCoolButtonExample/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
