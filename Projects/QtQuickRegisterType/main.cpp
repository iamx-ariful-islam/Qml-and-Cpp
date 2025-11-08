#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <person.h>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    qmlRegisterType<Person>("com.company.person", 1, 0, "Person");

    const QUrl url(u"qrc:/QtQuickRegisterType/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
