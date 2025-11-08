#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <backend.hpp>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<Backend>("backend", 1, 0, "Backend");


    const QUrl url(u"qrc:/QtQuickCameraPhoto/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
