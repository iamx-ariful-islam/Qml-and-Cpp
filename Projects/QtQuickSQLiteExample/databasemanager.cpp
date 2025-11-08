// databasemanager.cpp
#include "databasemanager.hpp"

DatabaseManager::DatabaseManager(QObject *parent) : QObject(parent)
{
    openDatabase();
    createTable();
}

DatabaseManager::~DatabaseManager()
{
    if (DB_Connection.isOpen()) {
        qWarning() << "Successfully close database";
        DB_Connection.close();
    }
}

void DatabaseManager::openDatabase()
{
    DB_Connection = QSqlDatabase::addDatabase("QSQLITE");
    DB_Connection.setDatabaseName("pathology_db.sqlite");

    if (!DB_Connection.open()) {
        qWarning() << "Error: " << DB_Connection.lastError();
    } else {
        qWarning() << "Successfully connected";
    }
}

void DatabaseManager::createTable()
{
    QSqlQuery query;
    query.exec("CREATE TABLE IF NOT EXISTS UserData(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, gender TEXT, age INTEGER)");
}

void DatabaseManager::addData(const QString &name, const QString &gender, int age)
{
    QSqlQuery query;
    query.prepare("INSERT INTO UserData(name, gender, age) VALUES (:name, :gender, :age)");
    // query.prepare("INSERT INTO UserData(name, gender, age) VALUES (?, ?, ?)");
    query.addBindValue(name);
    query.addBindValue(gender);
    query.addBindValue(age);

    if (!query.exec()) {
        qWarning() << "Error: " << query.lastError();
    }
}
