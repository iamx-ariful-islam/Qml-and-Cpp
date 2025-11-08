#ifndef BACKEND_HPP
#define BACKEND_HPP

#include <QObject>

class Backend : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString scrollingText READ scrollingText NOTIFY scrollingTextChanged FINAL)


public:
    explicit Backend(QObject *parent = nullptr);

    QString scrollingText() const;

    Q_INVOKABLE void addText(const QString &newText);

signals:
    void scrollingTextChanged();

private:
    QStringList m_textList;
    QString m_scrollingText;

    void updateScrollingText();
};

#endif // BACKEND_HPP
