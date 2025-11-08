#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <databasemanager.hpp>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    qmlRegisterType<DatabaseManager>("MyDatabase", 0, 1, "MyDatabase");


    const QUrl url(u"qrc:/QtQuickSQLiteExample/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
