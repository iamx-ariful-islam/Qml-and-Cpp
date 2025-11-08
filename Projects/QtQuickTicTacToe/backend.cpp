#include "backend.hpp"


Backend::Backend(QObject *parent)
    : QObject(parent), m_board(9, ""), m_gameStatus("Game in progress"), m_currentPlayer("X") {}

void Backend::makeMove(int index) {
    if (index < 0 || index >= 9 || !m_board[index].isEmpty() || m_gameStatus != "Game in progress")
        return;

    m_board[index] = m_currentPlayer;
    emit boardChanged();

    if (checkWin()) {
        m_gameStatus = QString("%1 Wins").arg(m_currentPlayer);
        emit gameStatusChanged();
        return;
    }

    if (checkDraw()) {
        m_gameStatus = "Draw";
        emit gameStatusChanged();
        return;
    }

    m_currentPlayer = (m_currentPlayer == "X") ? "O" : "X";
    emit currentPlayerChanged();
}

void Backend::resetGame() {
    m_board.fill("");
    m_gameStatus = "Game in progress";
    m_currentPlayer = "X";
    emit boardChanged();
    emit gameStatusChanged();
    emit currentPlayerChanged();
}

bool Backend::checkWin() {
    static const int winPatterns[8][3] = {
        {0, 1, 2}, {3, 4, 5}, {6, 7, 8},
        {0, 3, 6}, {1, 4, 7}, {2, 5, 8},
        {0, 4, 8}, {2, 4, 6}
    };

    for (auto &pattern : winPatterns) {
        if (!m_board[pattern[0]].isEmpty() &&
            m_board[pattern[0]] == m_board[pattern[1]] &&
            m_board[pattern[1]] == m_board[pattern[2]]) {
            return true;
        }
    }
    return false;
}

bool Backend::checkDraw() {
    for (const auto &cell : m_board) {
        if (cell.isEmpty()) return false;
    }
    return true;
}
