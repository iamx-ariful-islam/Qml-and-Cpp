#ifndef DATABASE_HPP
#define DATABASE_HPP

#include <QObject>
#include <QQmlEngine>
#include <QtSql/QSql>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlError>
#include <QtSql/QSqlDatabase>
#include <QFile>
#include <QDate>
#include <QDebug>
#include <QSqlTableModel>
#include <QStandardItemModel>
#include <QSqlRecord>

//#define DATABASE_HOSTNAME "NameDataBase"
#define DATABASE_NAME  "db_name.sqlite"
#define TABLE_NAME     "userData"


class DataBase : public QObject
{
    Q_OBJECT
    QML_ELEMENT

//// method #1
//public:
//    explicit DataBase(QObject *parent = nullptr);
//    void connectToDatabase();
//    ~DataBase();

// method #2
public:
    explicit DataBase(QObject *parent = nullptr);
    ~DataBase();

signals:
    void userDataReady(const QList<QList<QString>> &userDataList);

public slots:
    bool insertIntoTable(const QVariantList &data);      // Adding entries to the table
    bool insertIntoTable(const QString &fname, const QString &lname, const QString &gender);
    bool removeRecord(const int id); // Removing records from the table on its id
    void readUserData();

private:
    QSqlDatabase db;

    bool openDatabase();
    bool restoreDatabase();
    bool createTable();
};

#endif // DATABASE_HPP
