#ifndef PERSON_H
#define PERSON_H

#include <QObject>
#include <QQmlEngine>

class Person : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged FINAL)
    Q_PROPERTY(int age READ age WRITE setAge NOTIFY ageChanged FINAL)
    Q_PROPERTY(double salary READ salary WRITE setSalary NOTIFY salaryChanged FINAL)

public:
    explicit Person(QObject *parent = nullptr);

signals:
    void nameChanged();
    void ageChanged();
    void salaryChanged();

private:
    QString m_Name;
    int m_Age;
    double m_Salary;

    void setName(const QString &name);
    void setAge(const int &age);
    void setSalary(const double & salary);

    QString name() const;
    int age() const;
    double salary() const;

};

#endif // PERSON_H
