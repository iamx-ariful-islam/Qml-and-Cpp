#ifndef BACKEND_HPP
#define BACKEND_HPP

#include <QObject>
#include <QQmlEngine>

class Backend : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit Backend(QObject *parent = nullptr);

signals:
    void returnInfo(bool x);

public slots:
    void createFile();

};

#endif // BACKEND_HPP
