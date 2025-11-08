#include "backend.hpp"
#include <QFile>
#include <QString>
#include <QTextStream>
#include <QDebug>


Backend::Backend(QObject *parent)
    : QObject{parent}
{

}

void Backend::createFile()
{
    QString flName = "info.txt";
    QFile file(flName);

    bool msg = false;

    if (!file.exists()) {
        qDebug() << flName + ", this file are not exists";
        file.open(QIODevice::WriteOnly | QIODevice::Text);
        QTextStream out(&file);
        out << "This is test generated file\n";
        file.close();
        msg = true;
    } else {
        qDebug() << "This file is already exists";
    }
    emit returnInfo(msg);
}
