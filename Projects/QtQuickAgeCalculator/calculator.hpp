#ifndef CALCULATOR_HPP
#define CALCULATOR_HPP

#include <QObject>
#include <QDate>
#include <QString>
#include <QDebug>
#include <QRegularExpression>

class Calculator : public QObject
{
    Q_OBJECT
public:
    explicit Calculator(QObject *parent = nullptr);

    Q_INVOKABLE void calculateAge(const  QString &birthDate);
    Q_INVOKABLE void calculateBirthDate(const QString &birthYears, const QString &birthMonths, const QString &birthDays);


signals:
    void calculationCompleted(const QString &result);

};

#endif // CALCULATOR_HPP
