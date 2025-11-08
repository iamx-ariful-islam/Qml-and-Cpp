#include "calculator.hpp"

Calculator::Calculator(QObject *parent) : QObject{parent}
{

}

void Calculator::calculateAge(const QString &birthDate)
{
    static const QRegularExpression separatorRegex("[/\\-\\.]");
    QStringList dateParts = birthDate.split(separatorRegex);

    if (dateParts.size() != 3) {
        emit calculationCompleted("Invalid date format");
        return;
    }

    QDate currentDate = QDate::currentDate();
    int ageDays       = currentDate.day() - dateParts[0].toInt();
    int ageMonths     = currentDate.month() - dateParts[1].toInt();
    int ageYears      = currentDate.year() - dateParts[2].toInt();

    if (ageDays < 0) {
        ageMonths--;
        QDate prevMonth = currentDate.addMonths(-1);
        ageDays += prevMonth.daysInMonth();
    }
    if (ageMonths < 0) {
        ageYears--;
        ageMonths += 12;
    }

    QString result = QString("Age: %1 years, %2 months, %3 days").arg(ageYears).arg(ageMonths).arg(ageDays);

    emit calculationCompleted(result);
}

void Calculator::calculateBirthDate(const QString &birthYears, const QString &birthMonths, const QString &birthDays)
{
    int ageDays   = birthDays.toInt();
    int ageMonths = birthMonths.toInt();
    int ageYears  = birthYears.toInt();

    QDate currentDate = QDate::currentDate();
    QDate birthDate   = currentDate.addYears(-ageYears).addMonths(-ageMonths).addDays(-ageDays);

    if (birthDate.addYears(ageYears).addMonths(ageMonths).addDays(ageDays) < currentDate)
        birthDate = birthDate.addDays(1);

    QString result = QString("Birth Date: %1").arg(birthDate.toString("dd/MM/yyyy"));

    emit calculationCompleted(result);
}
