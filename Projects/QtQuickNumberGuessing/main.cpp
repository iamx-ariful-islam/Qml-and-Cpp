#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <backend.hpp>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<Backend>("myBeckend", 0, 1, "MyBeckend");

    const QUrl url(u"qrc:/QtQuickNumberGuessing/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
