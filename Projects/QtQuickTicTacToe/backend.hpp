#ifndef BACKEND_HPP
#define BACKEND_HPP

#include <QObject>
#include <QStringList>


class Backend : public QObject {
    Q_OBJECT
    Q_PROPERTY(QStringList board READ board NOTIFY boardChanged)
    Q_PROPERTY(QString gameStatus READ gameStatus NOTIFY gameStatusChanged)
    Q_PROPERTY(QString currentPlayer READ currentPlayer NOTIFY currentPlayerChanged)

public:
    explicit Backend(QObject *parent = nullptr);

    Q_INVOKABLE void makeMove(int index);
    Q_INVOKABLE void resetGame();

    QStringList board() const { return m_board; }
    QString gameStatus() const { return m_gameStatus; }
    QString currentPlayer() const { return m_currentPlayer; }

signals:
    void boardChanged();
    void gameStatusChanged();
    void currentPlayerChanged();

private:
    QStringList m_board;
    QString m_gameStatus;
    QString m_currentPlayer;

    bool checkWin();
    bool checkDraw();

};

#endif // BACKEND_HPP
