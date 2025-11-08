#include "backend.hpp"
#include <QRandomGenerator>

Backend::Backend(QObject *parent)
    : QObject{parent}
{

}

void Backend::startGame(int min, int max) {
    setAttempts(0);
    m_targetNumber = QRandomGenerator::global()->bounded(min, max + 1);
    setMessage("Game Started! Guess the number.");
}

void Backend::checkGuess(int guess) {
    setAttempts(m_attempts + 1);

    if (m_attempts >= 5) {
        setMessage("Game Over! Too many attempts.");
        return;
    }

    if (guess == m_targetNumber) {
        setMessage("Correct! You guessed it in " + QString::number(m_attempts) + " attempts.");
    } else {
        setMessage(guess < m_targetNumber ? "Too low!" : "Too high!");
    }
}

void Backend::resetGame()
{
    setAttempts(0);
    m_targetNumber = 0;
    setMessage("Game reset. Start a new game!");
}

void Backend::setAttempts(int attempts) {
    if (m_attempts == attempts) return;
    m_attempts = attempts;
    emit attemptsChanged();
}

void Backend::setMessage(const QString &msg) {
    if (m_message == msg) return;
    m_message = msg;
    emit messageChanged();
}
