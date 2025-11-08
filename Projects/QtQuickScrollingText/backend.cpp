#include "backend.hpp"

Backend::Backend(QObject *parent) : QObject{parent}
{
    m_textList << "This is first text" << "This is second text" << "This is third text";
    updateScrollingText();
}

QString Backend::scrollingText() const
{
    return m_scrollingText;
}

void Backend::addText(const QString &newText)
{
    m_textList.append(newText);
    updateScrollingText();
}

void Backend::updateScrollingText()
{
    m_scrollingText = m_textList.join(" * "); // join texts with separator "*"
    emit scrollingTextChanged();
}
