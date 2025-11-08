#ifndef STOPWATCH_HPP
#define STOPWATCH_HPP

#include <QObject>
#include <QString>
#include <QDate>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlError>

class Stopwatch : public QObject {
    Q_OBJECT

public:
    explicit Stopwatch(QObject *parent = nullptr);
    ~Stopwatch();

    Q_INVOKABLE void insertLapData(const QString &msg, const QVariantList &lapData);
    Q_INVOKABLE void deleteAllLapData(const QString &msg);

private:
    void initializeDatabase();
    QSqlDatabase db;;
};

#endif // STOPWATCH_HPP
