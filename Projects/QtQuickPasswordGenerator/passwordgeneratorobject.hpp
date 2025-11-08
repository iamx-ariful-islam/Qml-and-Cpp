#ifndef PASSWORDGENERATOROBJECT_HPP
#define PASSWORDGENERATOROBJECT_HPP

#include <QObject>

class PasswordGeneratorObject : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString password READ getPassword NOTIFY passwordChanged)
    Q_PROPERTY(int passwordLength READ getPasswordLength WRITE setPasswordLength NOTIFY passwordLengthChanged)

    Q_PROPERTY(bool useLowerCase READ useLowerCase WRITE setUseLowerCase NOTIFY useLowerCaseChanged)
    Q_PROPERTY(bool useUpperCase READ useUpperCase WRITE setUseUpperCase NOTIFY useUpperCaseChanged)
    Q_PROPERTY(bool useNumbers READ useNumbers WRITE setUseNumbers NOTIFY useNumbersChanged)
    Q_PROPERTY(bool useSpecialCharacters READ useSpecialCharacters WRITE setUseSpecialCharacters NOTIFY useSpecialCharactersChanged)

public:
    explicit PasswordGeneratorObject(QObject *parent = nullptr);

    QString getPassword() const;

    Q_INVOKABLE void makeAlphabet();
    void setPassword();

    int getPasswordLength() const;
    void setPasswordLength(int newPasswordLength);

    bool useLowerCase() const;
    void setUseLowerCase(bool newUseLowerCase);

    bool useUpperCase() const;
    void setUseUpperCase(bool newUserUpperCase);

    bool useNumbers() const;
    void setUseNumbers(bool newUseNumbers);

    bool useSpecialCharacters() const;
    void setUseSpecialCharacters(bool newUseSpecialCharacters);

signals:
    void passwordChanged();

    void passwordLengthChanged();

    void useLowerCaseChanged();

    void useUpperCaseChanged();

    void useNumbersChanged();

    void useSpecialCharactersChanged();

private:
    QString m_alphabet;
    QString m_password{""};

    int m_passwordLength{5};
    bool m_useLowerCase;
    bool m_useUpperCase;
    bool m_useNumbers;
    bool m_useSpecialCharacters;

};

#endif // PASSWORDGENERATOROBJECT_HPP
