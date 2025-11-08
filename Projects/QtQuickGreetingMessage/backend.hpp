#ifndef BACKEND_HPP
#define BACKEND_HPP

#include <QObject>
#include <QQmlEngine>
#include <QDateTime>
#include <QString>

class Backend : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit Backend(QObject *parent = nullptr);
    void greetingMessage();

signals:
    void valueChanged(QString str, bool imageEvent);

public slots:
    void getGreetingMessage();
};

#endif // BACKEND_HPP
