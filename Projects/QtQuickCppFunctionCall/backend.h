#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QQmlEngine>

class Backend : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit Backend(QObject *parent = nullptr);

signals:

public slots:
    void callFromQML();

};

#endif // BACKEND_H
