#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <databasemanager.hpp>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    qmlRegisterType<DatabaseManager>("dbManager", 1, 0, "DBManager");

    const QUrl url(u"qrc:/QtQuickSimpleSqliteUserInfProject/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
