#include "backend.h"
#include <QDebug>

Backend::Backend(QObject *parent)
    : QObject{parent}
{

}

void Backend::callFromQML()
{
    qDebug("Receive call from qml button click");
}
