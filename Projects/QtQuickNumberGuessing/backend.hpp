#ifndef BACKEND_HPP
#define BACKEND_HPP

#include <QObject>
#include <QQmlEngine>

class Backend : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int attempts READ attempts WRITE setAttempts NOTIFY attemptsChanged FINAL)
    Q_PROPERTY(QString message READ message WRITE setMessage NOTIFY messageChanged FINAL)

    QML_ELEMENT
public:
    explicit Backend(QObject *parent = nullptr);

    Q_INVOKABLE void startGame(int min, int max);
    Q_INVOKABLE void checkGuess(int guess);
    Q_INVOKABLE void resetGame();

    int attempts() const { return m_attempts; }
    void setAttempts(int attempts);

    QString message() const { return m_message; }
    void setMessage(const QString &msg);

signals:
    void attemptsChanged();
    void messageChanged();

private:
    int m_attempts = 0;
    int m_targetNumber;
    QString m_message = "Click <Start Game> for game start!";
};

#endif // BACKEND_HPP
