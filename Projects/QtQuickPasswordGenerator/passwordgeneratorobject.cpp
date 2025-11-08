#include "passwordgeneratorobject.hpp"
#include <random>

PasswordGeneratorObject::PasswordGeneratorObject(QObject *parent)
    : QObject{parent}
{

}

QString PasswordGeneratorObject::getPassword() const
{
    return m_password;
}

void PasswordGeneratorObject::setPassword()
{
    std::random_device rd;
    std::mt19937 valueGenerator{rd()};
    std::uniform_int_distribution<> distribution(0, m_alphabet.size()-1);

    QString tempPassword{};
    int codeValue{0};
    for(auto i = 0; i < m_passwordLength; i++)
    {
        codeValue = (distribution(valueGenerator));
        tempPassword.append(m_alphabet.at(codeValue));
    }

    m_password = tempPassword;

    emit passwordChanged();

}

void PasswordGeneratorObject::makeAlphabet()
{
    m_alphabet.clear();
    QString upperCaseLetters{"ABCDEFGHIJKLMNOPQRSTUVWXYZ"};
    QString lowerCaseLetters{"abcdefghijklmnopqrstuvwxyz"};
    QString numbers{"0123456789"};
    QString specialCharacters{QStringLiteral("!@#$%^&*()_+-=;':\",./<>?~`")};

    if(m_useUpperCase)
    {
        m_alphabet.append(upperCaseLetters);
    }
    if(m_useLowerCase)
    {
        m_alphabet.append(lowerCaseLetters);
    }
    if(m_useNumbers)
    {
        m_alphabet.append(numbers);
    }
    if(m_useSpecialCharacters)
    {
        m_alphabet.append(specialCharacters);
    }
    setPassword();
}

int PasswordGeneratorObject::getPasswordLength() const
{
    return m_passwordLength;
}

void PasswordGeneratorObject::setPasswordLength(int newPasswordLength)
{
    if (m_passwordLength == newPasswordLength)
        return;
    m_passwordLength = newPasswordLength;
    emit passwordLengthChanged();
}

bool PasswordGeneratorObject::useLowerCase() const
{
    return m_useLowerCase;
}

void PasswordGeneratorObject::setUseLowerCase(bool newUseLowerCase)
{
    if (m_useLowerCase == newUseLowerCase)
        return;
    m_useLowerCase = newUseLowerCase;
    emit useLowerCaseChanged();
}

bool PasswordGeneratorObject::useUpperCase() const
{
    return m_useUpperCase;
}

void PasswordGeneratorObject::setUseUpperCase(bool newUserUpperCase)
{
    if (m_useUpperCase == newUserUpperCase)
        return;
    m_useUpperCase = newUserUpperCase;
    emit useUpperCaseChanged();
}

bool PasswordGeneratorObject::useNumbers() const
{
    return m_useNumbers;
}

void PasswordGeneratorObject::setUseNumbers(bool newUseNumbers)
{
    if (m_useNumbers == newUseNumbers)
        return;
    m_useNumbers = newUseNumbers;
    emit useNumbersChanged();
}

bool PasswordGeneratorObject::useSpecialCharacters() const
{
    return m_useSpecialCharacters;
}

void PasswordGeneratorObject::setUseSpecialCharacters(bool newUseSpecialCharacters)
{
    if (m_useSpecialCharacters == newUseSpecialCharacters)
        return;
    m_useSpecialCharacters = newUseSpecialCharacters;
    emit useSpecialCharactersChanged();
}
