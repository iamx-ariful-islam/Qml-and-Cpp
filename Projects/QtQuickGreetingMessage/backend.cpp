#include "backend.hpp"

Backend::Backend(QObject *parent)
    : QObject{parent}
{
}

void Backend::greetingMessage()
{
    qint8 hour   = QTime::currentTime().hour();
    qint8 minute = QTime::currentTime().minute();
    QString greetingMsg = QString("Hi, %1 | Good ").arg(QString::fromUtf8(qgetenv("USERNAME")).toUpper());

    static const QMap<int, QString> timeMap = {
        {4, "Dawn"}, {6, "Morning"}, {9, "Forenoon"}, {12, "Noon"},
        {13, "Afternoon"}, {16, "Late Afternoon"}, {18, "Dusk"},
        {19, "Evening"}, {20, "Night"}, {0, "Midnight"}
    };

    QString timeOfDay = timeMap.lowerBound(hour).value();
    if (hour == 18 && minute < 30) timeOfDay = "Late Afternoon"; // adjust "Dusk" condition

    greetingMsg += timeOfDay;
    // emit valueChanged(greetingMsg, (hour>=6 && hour<19));

    bool imageEvent = hour >= 6 && hour < 19;
    emit valueChanged(greetingMsg, imageEvent);
}

void Backend::getGreetingMessage()
{
    greetingMessage();
}
