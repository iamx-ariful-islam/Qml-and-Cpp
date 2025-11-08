#ifndef MYCLASS_HPP
#define MYCLASS_HPP

#include <QObject>
#include <QQmlEngine>
#include <QString>
#include <QDateTime>
#include <QDebug>
#include <QTimer>

class MyClass : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString clock READ clock WRITE setClock NOTIFY clockChanged FINAL)

    QML_ELEMENT
public:
    explicit MyClass(QObject *parent = nullptr);
    ~MyClass();

    QString clock() const;

    Q_INVOKABLE void newValuePot(int value);
    Q_INVOKABLE void startTimer();
    Q_INVOKABLE void stopTimer();

signals:
    void newData(int value);
    void clockChanged(QString);

public slots:
    void setClock(QString);

private:
    QString m_clock{"00:00:00"};
    QTimer *m_timer;

};

#endif // MYCLASS_HPP
