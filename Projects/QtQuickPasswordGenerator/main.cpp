#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <passwordgeneratorobject.hpp>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;


    qmlRegisterType<PasswordGeneratorObject>("com.jonaki.password", 0, 1, "Password");

    const QUrl url(u"qrc:/QtQuickPaswordGenerator/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
