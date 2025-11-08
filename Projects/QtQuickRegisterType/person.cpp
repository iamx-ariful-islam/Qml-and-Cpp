#include "person.h"

Person::Person(QObject *parent)
    : QObject{parent}
{
    m_Name = "";
    m_Age = 0;
    m_Salary = 0.0;
}

void Person::setName(const QString &name)
{
    if (m_Name != name){
        m_Name = name;
        emit nameChanged();
    }
}

void Person::setAge(const int &age)
{
    if (m_Age != age){
        m_Age = age;
        emit ageChanged();
    }
}

void Person::setSalary(const double &salary)
{
    if (m_Salary != salary){
        m_Salary = salary;
        emit salaryChanged();
    }
}

QString Person::name() const
{
    return m_Name;
}

int Person::age() const
{
    return m_Age;
}

double Person::salary() const
{
    return m_Salary;
}
