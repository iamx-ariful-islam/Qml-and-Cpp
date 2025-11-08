#include "filemanagebackend.hpp"

FileManageBackend::FileManageBackend(QObject *parent)
    : QObject{parent}
{

}

QStringList FileManageBackend::fileSearch(const QString &path)
{
    m_List.clear();
    QDir directory(path.mid(8));
    QStringList filter;

    filter << "*.png" << "*.jpg" << ".gif";
    directory.setNameFilters(filter);
    directory.setFilter(QDir::Files);

    foreach (QString data, directory.entryList()) {
        m_List.append("file:///"+ path.mid(8) + "/" + data);
        //qDebug() << "file:///"+ path + "/" + data;
    }
    //m_List = directory.entryList();
    return m_List;
}

QStringList FileManageBackend::removeItems(const int &index)
{
    if (m_List.length() <= 1) return m_List;
    m_List.remove(index);
    return m_List;
}
