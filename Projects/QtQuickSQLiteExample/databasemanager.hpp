#ifndef DATABASEMANAGER_HPP
#define DATABASEMANAGER_HPP

#include <QObject>
#include <QString>
#include <QQmlEngine>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlError>

class DatabaseManager : public QObject
{
    Q_OBJECT
    QML_ELEMENT

public:
    explicit DatabaseManager(QObject *parent = nullptr);
    ~DatabaseManager();

    Q_INVOKABLE void addData(const QString &name, const QString &gender, int age);

signals:

private:
    QSqlDatabase DB_Connection;

    void openDatabase();
    void createTable();
};

#endif // DATABASEMANAGER_HPP
