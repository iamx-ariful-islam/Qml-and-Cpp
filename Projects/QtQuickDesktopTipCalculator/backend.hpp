#ifndef BACKEND_HPP
#define BACKEND_HPP

#include <QObject>
#include <QQmlEngine>

class Backend : public QObject
{
    Q_OBJECT

    Q_PROPERTY(double billAmount READ billAmount WRITE setBillAmount NOTIFY billAmountChanged FINAL)
    Q_PROPERTY(double tipAmount READ tipAmount WRITE setTipAmount NOTIFY tipAmountChanged FINAL)
    Q_PROPERTY(double tipRate READ tipRate WRITE setTipRate NOTIFY tipRateChanged FINAL)
    Q_PROPERTY(int numberOfPeople READ numberOfPeople WRITE setNumberOfPeople NOTIFY numberOfPeopleChanged FINAL)
    Q_PROPERTY(double totalAmount READ totalAmount WRITE setTotalAmount NOTIFY totalAmountChanged FINAL)

    QML_ELEMENT
public:
    explicit Backend(QObject *parent = nullptr);

    double billAmount() const;
    void setBillAmount(double newBillAmount);

    double tipAmount() const;
    void setTipAmount(double newTipAmount);

    double tipRate() const;
    void setTipRate(double newTipRate);

    int numberOfPeople() const;
    void setNumberOfPeople(int newNumberOfPeople);

    double totalAmount() const;
    void setTotalAmount(double newTotalAmount);

signals:
    void billAmountChanged();
    void tipAmountChanged();
    void tipRateChanged();
    void numberOfPeopleChanged();
    void totalAmountChanged();

public slots:
    void calculateTotal();
    void resetValues();

private:
    double m_billAmount{0};
    double m_tipAmount{0};
    double m_tipRate{15};
    int m_numberOfPeople{1};
    double m_totalAmount{0};

};

#endif // BACKEND_HPP
