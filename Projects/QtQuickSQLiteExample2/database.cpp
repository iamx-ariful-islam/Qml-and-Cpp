#include "database.hpp"

//// method #1
//DataBase::DataBase(QObject *parent)
//    : QObject{parent}
//{
//    connectToDatabase();
//}

// method #2 // constructor function
DataBase::DataBase(QObject *parent)
    : QObject{parent}
{
    qWarning() << "Try to establish connection";

    if(!QFile(DATABASE_NAME).exists()){
        this->restoreDatabase();
    } else {
        this->openDatabase();
    }
}

// destructor function
DataBase::~DataBase()
{
    if (db.isOpen()) {
        qWarning() << "Database close successfully";
        db.close();
    }
}

//// method #1
//void DataBase::connectToDatabase()
//{
//    qWarning() << "Try to establish connection";

//    if(!QFile(DATABASE_NAME).exists()){
//        this->restoreDatabase();
//    } else {
//        this->openDatabase();
//    }
//}

bool DataBase::restoreDatabase()
{
    if(this->openDatabase()){
        return (this->createTable()) ? true : false;
    } else {
        qDebug() << "Failed to restore the database";
        return false;
    }
    return false;
}

bool DataBase::openDatabase()
{
    db = QSqlDatabase::addDatabase("QSQLITE");
//    db.setHostName(DATABASE_HOSTNAME);
    db.setDatabaseName(DATABASE_NAME);
    if(db.open()){
        qWarning() << "Successfully open database";
        return true;
    } else {
        return false;
    }
}

bool DataBase::createTable()
{
    QSqlQuery query;

    if(!query.exec( "CREATE TABLE " TABLE_NAME "(id INTEGER PRIMARY KEY AUTOINCREMENT, fname VARCHAR(255) NOT NULL, lname VARCHAR(255) NOT NULL, gender VARCHAR(255) NOT NULL)")){
        qDebug() << "DataBase: error of create " << TABLE_NAME;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

bool DataBase::insertIntoTable(const QVariantList &data)
{
    QSqlQuery query;

    query.prepare("INSERT INTO " TABLE_NAME "(fname, lname, gender) VALUES (:fname, :lname, :gender)");
    query.bindValue(":fname",    data[0].toString());
    query.bindValue(":lname",    data[1].toString());
    query.bindValue(":gender",   data[2].toString());

    if(!query.exec()){
        qDebug() << "error insert into :" << TABLE_NAME;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

bool DataBase::insertIntoTable(const QString &fname, const QString &lname, const QString &gender)
{
    QVariantList data;
    data.append(fname);
    data.append(lname);
    data.append(gender);

    if(insertIntoTable(data))
        return true;
    else
        return false;
}

bool DataBase::removeRecord(const int id)
{
    QSqlQuery query;

    query.prepare("DELETE FROM " TABLE_NAME " WHERE id=:ID;");
    query.bindValue(":ID", id);

    if(!query.exec()){
        qDebug() << "error delete row " << TABLE_NAME;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

void DataBase::readUserData()
{
    QSqlTableModel *sqlModel = new QSqlTableModel(this, db);
    sqlModel->setTable(TABLE_NAME);
    sqlModel->select();

    QList<QList<QString>> userList;  // List to store user data

    for (int i = 0; i < sqlModel->rowCount(); ++i) {
        QList<QString> userData;
        userData << sqlModel->record(i).value("fname").toString()
                 << sqlModel->record(i).value("lname").toString()
                 << sqlModel->record(i).value("gender").toString();

        userList.append(userData);
    }

    emit userDataReady(userList);
}
