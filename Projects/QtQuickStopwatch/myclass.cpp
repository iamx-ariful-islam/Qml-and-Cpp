#include "myclass.hpp"
#include <QRandomGenerator>


MyClass::MyClass(QObject *parent)
    : QObject{parent}//, m_timer(nullptr) // Initialize m_timer to nullptr
{
    m_timer = new QTimer(this); // Create a QTimer instance and assign it to m_timer

    // Connect the timeout signal to the lambda function with 'this' as the context object
    QObject::connect(m_timer, &QTimer::timeout, this, [&](){
        this->setClock(QDateTime::currentDateTime().toString("HH:mm:ss"));
        qInfo().noquote().nospace() << "Tick: " << QDateTime::currentDateTime().toString("HH:mm:ss");
    });
}

MyClass::~MyClass()
{
    if (m_timer) {
        delete m_timer;
        m_timer = nullptr;
    }
}

QString MyClass::clock() const
{
    return m_clock;
}

void MyClass::newValuePot(int value)
{
    QRandomGenerator::securelySeeded(); // Seed the random number generator securely

    qInfo().noquote().nospace() << "New Value[" << QRandomGenerator::global()->bounded(value) << "]";
    Q_EMIT newData(QRandomGenerator::global()->bounded(value));
}

void MyClass::startTimer()
{
    m_timer->start(1000);
}

void MyClass::stopTimer()
{
    m_timer->stop();
}

void MyClass::setClock(QString time)
{
    if (m_clock == time)
        return;

    m_clock = time;
    emit clockChanged(m_clock);
}
