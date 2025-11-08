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
    void valueChanged(QString str);

public slots:
    void changeValue(int x);
};

#endif // BACKEND_H
