#include "backend.hpp"
#include <QDebug>

Backend::Backend(QObject *parent): QObject{parent}
{

}

int Backend::property()
{
    qDebug() << __FUNCTION__ << "function";
    return m_property;
}

void Backend::setProperty(int prt)
{
    qDebug() << __FUNCTION__ << "set function" << "prt: " << prt;

    if (m_property == prt)
        return;
    m_property = prt;
    emit propertyChanged();
}
