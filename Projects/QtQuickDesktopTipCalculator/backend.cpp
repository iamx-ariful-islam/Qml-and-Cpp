#include "backend.hpp"
#include <QDebug>


Backend::Backend(QObject *parent)
    : QObject{parent}
{

}

double Backend::billAmount() const
{
    return m_billAmount;
}

void Backend::setBillAmount(double newBillAmount)
{
    if (qFuzzyCompare(m_billAmount, newBillAmount))
        return;
    m_billAmount = newBillAmount;
    emit billAmountChanged();
}

double Backend::tipAmount() const
{
    return m_tipAmount;
}

void Backend::setTipAmount(double newTipAmount)
{
    if (qFuzzyCompare(m_tipAmount, newTipAmount)) // qFuzzyCompare() function used for comparing floating-point numbers
        return;
    m_tipAmount = newTipAmount;
    emit tipAmountChanged();
}

double Backend::tipRate() const
{
    return m_tipRate;
}

void Backend::setTipRate(double newTipRate)
{
    qDebug() << newTipRate;

    if (qFuzzyCompare(m_tipRate, newTipRate))
        return;
    m_tipRate = newTipRate;
    emit tipRateChanged();
}

int Backend::numberOfPeople() const
{
    return m_numberOfPeople;
}

void Backend::setNumberOfPeople(int newNumberOfPeople)
{
    if (m_numberOfPeople == newNumberOfPeople)
        return;
    m_numberOfPeople = newNumberOfPeople;
    emit numberOfPeopleChanged();
}

double Backend::totalAmount() const
{
    return m_totalAmount;
}

void Backend::setTotalAmount(double newTotalAmount)
{
    if (qFuzzyCompare(m_totalAmount, newTotalAmount))
        return;
    m_totalAmount = newTotalAmount;
    emit totalAmountChanged();
}

void Backend::calculateTotal()
{
    m_tipAmount = (m_billAmount * (m_tipRate * 0.01)) / m_numberOfPeople;

    emit tipAmountChanged();
    m_totalAmount = (m_billAmount + m_tipAmount) / m_numberOfPeople;
    emit totalAmountChanged();
}

void Backend::resetValues()
{
    m_billAmount = {0};
    m_tipAmount = {0};
    m_tipRate = {15};
    m_numberOfPeople = {1};
    m_totalAmount = {0};

    emit billAmountChanged();
    emit tipAmountChanged();
    emit tipRateChanged();
    emit numberOfPeopleChanged();
    emit totalAmountChanged();
}
