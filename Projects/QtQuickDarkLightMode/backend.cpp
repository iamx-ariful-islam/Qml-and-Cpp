#include "backend.h"

Backend::Backend(QObject *parent)
    : QObject{parent}
{
    m_isNightMode = false;
}

void Backend::setIsNightMode(const bool &isNightMode)
{
    if (m_isNightMode != isNightMode){
        m_isNightMode = isNightMode;
        emit isNightModeChanged();
    }
}

bool Backend::isNightMode() const
{
    return m_isNightMode;
}
