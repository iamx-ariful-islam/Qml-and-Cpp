#ifndef DATABASEMANAGER_HPP
#define DATABASEMANAGER_HPP

#include <QObject>
#include <QQmlEngine>
#include <QString>
#include <QtSql/QSql>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlError>
#include <QtSql/QSqlDatabase>
#include <QFile>
#include <QDebug>
#include <QSqlTableModel>
#include <QStandardItemModel>
#include <QSqlRecord>

#define DATABASE_NAME  "db_name.sqlite"
#define TABLE_NAME     "userData"

class DatabaseManager : public QObject
{
    Q_OBJECT
    QML_ELEMENT

public:
    explicit DatabaseManager(QObject *parent = nullptr);
    ~DatabaseManager();

signals:
    void getAllUserData(const QList<QList<QString>> &userData);

public slots:
    bool insertUserData(const QString name, const int age, const QString gender);

private:
    QSqlDatabase db;

    bool openDatabase();
    bool restoreDatabase();
    bool createTable();
    void readUserData();
};

#endif // DATABASEMANAGER_HPP
