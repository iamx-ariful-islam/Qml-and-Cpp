#include "backend.h"

Backend::Backend(QObject *parent)
    : QObject{parent}
{

}

void Backend::changeValue(int a)
{
    if (a == 1) {
        emit valueChanged("value is 1, from button 1");
    }
    else if (a == 2) {
        emit valueChanged("value is 2, from button 2");
    }
    else {
        emit valueChanged("Nothing from button 3");
    }
}
