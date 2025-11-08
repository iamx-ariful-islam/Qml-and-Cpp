#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QQmlEngine>

class Backend : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(bool isNightMode READ isNightMode WRITE setIsNightMode NOTIFY isNightModeChanged FINAL)

public:
    explicit Backend(QObject *parent = nullptr);

signals:
    void isNightModeChanged();

private:
    bool m_isNightMode;

    void setIsNightMode(const bool &isNightMode);

    bool isNightMode() const;

};

#endif // BACKEND_H
