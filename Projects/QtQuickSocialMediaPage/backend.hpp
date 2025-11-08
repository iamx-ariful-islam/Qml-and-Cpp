#ifndef BACKEND_HPP
#define BACKEND_HPP

#include <QObject>
#include <QDesktopServices>
#include <QUrl>

class Backend : public QObject
{
    Q_OBJECT
public:
    explicit Backend(QObject *parent = nullptr);

signals:

public slots:
    void openUrlInNewTab(const QUrl &url);

};

#endif // BACKEND_HPP
