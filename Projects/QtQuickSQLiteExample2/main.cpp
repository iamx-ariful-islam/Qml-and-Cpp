#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "database.hpp"
//#include "listmodel.hpp"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

//    DataBase database;
//    database.connectToDataBase();

//    ListModel *model = new ListModel();

//    engine.rootContext()->setContextProperty("myModel", model);
//    engine.rootContext()->setContextProperty("database", &database);

    qmlRegisterType<DataBase>("MyModule", 0, 1, "MyObject");

    const QUrl url(u"qrc:/QtQuickSQLiteExample2/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
