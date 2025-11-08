#ifndef BACKEND_HPP
#define BACKEND_HPP

#include <QObject>
#include <QQmlEngine>

class Backend : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(int property READ property WRITE setProperty NOTIFY propertyChanged FINAL)

public:
    explicit Backend(QObject *parent = nullptr);


public slots:
    int property();
    void setProperty(int prt);

signals:
    void propertyChanged();

private:
    int m_property;
};

#endif // BACKEND_HPP
