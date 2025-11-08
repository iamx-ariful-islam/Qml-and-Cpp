#ifndef FILEMANAGEBACKEND_HPP
#define FILEMANAGEBACKEND_HPP

#include <QObject>
#include <QQmlEngine>
#include <QDir>


class FileManageBackend : public QObject
{
    Q_OBJECT
    QML_ELEMENT

public:
    explicit FileManageBackend(QObject *parent = nullptr);

    Q_INVOKABLE QStringList fileSearch(const QString &path);
    Q_INVOKABLE QStringList removeItems(const int &index);

private:
    QStringList m_List;

};

#endif // FILEMANAGEBACKEND_HPP
