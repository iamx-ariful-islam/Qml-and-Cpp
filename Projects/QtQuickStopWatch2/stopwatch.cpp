#include "Stopwatch.hpp"
#include <QDebug>

Stopwatch::Stopwatch(QObject *parent) : QObject(parent) {
    initializeDatabase();
}

Stopwatch::~Stopwatch()
{
    if (db.isOpen()) {
        db.close();
    }
}

void Stopwatch::insertLapData(const QString &msg, const QVariantList &lapData)
{
    if (!db.isOpen()) {
        qDebug() << "Database is not open!";
        return;
    }

    QSqlQuery query;
    query.prepare("INSERT INTO lap_times (msg, lap_time, total_time) VALUES (:msg, :lapTime, :totalTime)");

    for (const QVariant &item : lapData) {
        QVariantList record = item.toList();
        if (record.size() == 2) {
            query.bindValue(":msg", msg);                    // Static msg for all rows
            query.bindValue(":lapTime", record[0].toString());
            query.bindValue(":totalTime", record[1].toString());

            if (!query.exec()) {
                qDebug() << "Insert Error:" << query.lastError().text();
            } else {
                qDebug() << "Inserted: Msg =" << msg
                         << " Lap Time =" << record[0].toString()
                         << " Total Time =" << record[1].toString();
            }
        } else {
            qDebug() << "Invalid record size. Expected [lapTime, totalTime]";
        }
    }
}

void Stopwatch::deleteAllLapData(const QString &msg)
{
    if (!db.isOpen()) {
        qDebug() << "Database is not open!";
        return;
    }

    QSqlQuery query;
    query.prepare("DELETE FROM lap_times WHERE msg = :msg");
    query.bindValue(":msg", msg);

    if (!query.exec()) {
        qDebug() << "Delete Error:" << query.lastError().text();
    } else {
        int rowsDeleted = query.numRowsAffected();
        qDebug() << "Deleted" << rowsDeleted << "records with message:" << msg;
    }
}

void Stopwatch::initializeDatabase()
{
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("stopwatch.db");

    if (!db.open()) {
        qDebug() << "Error: Cannot open database!" << db.lastError().text();
        return;
    }

    // Create lap_times table if not exists
    QSqlQuery query;
    query.exec("CREATE TABLE IF NOT EXISTS lap_times ("
               "id INTEGER PRIMARY KEY AUTOINCREMENT, "
               "msg TEXT NOT NULL, "
               "lap_time TEXT NOT NULL, "
               "total_time TEXT NOT NULL)");

    if (query.lastError().isValid()) {
        qDebug() << "Database Error:" << query.lastError().text();
    }
}
