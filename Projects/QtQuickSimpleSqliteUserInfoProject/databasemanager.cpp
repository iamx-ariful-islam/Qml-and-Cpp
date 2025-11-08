#include "databasemanager.hpp"
#include <QVariant>
#include <QtSql/QSqlQuery>


DatabaseManager::DatabaseManager(QObject *parent)
    : QObject{parent}
{
    qWarning() << "Try to establish connection";

    if(!QFile(DATABASE_NAME).exists()){
        this->restoreDatabase();
    } else {
        this->openDatabase();
    }
}

DatabaseManager::~DatabaseManager()
{
    if (db.isOpen()) {
        qWarning() << "Database close successfully";
        db.close();
    }
}

bool DatabaseManager::insertUserData(const QString name, const int age, const QString gender)
{
    QSqlQuery query;
    query.prepare("INSERT INTO UserData (name, age, gender) VALUES (:name, :age, :gender)");
    query.bindValue(":name", name);
    query.bindValue(":age", age);
    query.bindValue(":gender", gender);

    if(!query.exec()){
        qDebug() << "error insert into :" << TABLE_NAME;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

bool DatabaseManager::openDatabase()
{
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(DATABASE_NAME);
    if(db.open()){
        qWarning() << "Successfully open database";
        return true;
    } else {
        return false;
    }
}

bool DatabaseManager::restoreDatabase()
{
    if(this->openDatabase()){
        return (this->createTable()) ? true : false;
    } else {
        qDebug() << "Failed to restore the database";
        return false;
    }
    return false;
}

bool DatabaseManager::createTable()
{
    QSqlQuery query;

    if(!query.exec( "CREATE TABLE " TABLE_NAME "(id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(255) NOT NULL, age INTEGER NOT NULL, gender VARCHAR(255) NOT NULL)")){
        qDebug() << "DataBase: error of create " << TABLE_NAME;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

void DatabaseManager::readUserData()
{
    QSqlTableModel *sqlModel = new QSqlTableModel(this, db);
    sqlModel->setTable(TABLE_NAME);
    sqlModel->select();

    QList<QList<QString>> userList;  // List to store user data

    for (int i = 0; i < sqlModel->rowCount(); ++i) {
        QList<QString> userData;
        userData << sqlModel->record(i).value("name").toString()
                 << sqlModel->record(i).value("age").toString()
                 << sqlModel->record(i).value("gender").toString();

        userList.append(userData);
    }
    emit getAllUserData(userList);
}
