import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
import myBackend

ApplicationWindow {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Tic Tac Toe")


    property bool gameStarted: false
    property bool running: false
    property int elapsedTime: 0

    Timer {
        id: timer
        interval: 1000
        running: running
        repeat: true
        onTriggered: {
            elapsedTime++
            gameTimer.text = new Date(elapsedTime * 1000).toISOString().substr(11, 8) // Extract HH:MM:SS
        }
    }


    // Connect the TicTacToeGame class
    MyBackend {
        id: ticTacToe
    }

    RowLayout {
        spacing: 50
        anchors.centerIn: parent

        ColumnLayout {
            spacing: 10

            Text {
                Layout.fillWidth: true
                text: qsTr("Tic Tac Toe")
                font {
                    family: "Ubuntu"
                    pixelSize: 25
                    weight: Font.Bold
                }
            }

            TextField {
                id: playerName
                placeholderText: qsTr("Enter Your Name")
                Layout.fillWidth: true
                enabled: !gameStarted
            }

            ComboBox {
                id: gameOptions
                model: ["Human vs Human", "Computer vs Human"]
                Layout.fillWidth: true
                enabled: !gameStarted
            }

            RowLayout {
                spacing: 10

                Button {
                    id: xChoice
                    text: qsTr("X")
                    enabled: !gameStarted
                }

                Button {
                    id: oChoice
                    text: qsTr("O")
                    enabled: !gameStarted
                }

                Button {
                    id: startButton
                    text: gameStarted ? qsTr("Reset Game") : qsTr("Start Game")
                    implicitWidth: 120
                    onClicked: {
                        gameStarted = ! gameStarted
                        ticTacToe.resetGame()
                        running = !running
                        running ? timer.start() : timer.stop()
                    }
                }
            }

            Label {
                id: note
                text: "Start Your Game"
                font.pixelSize: 24
                Layout.alignment: Qt.AlignHCenter
            }

            ColumnLayout {
                spacing: 10
                visible: playerName.text !== "" && gameStarted

                Rectangle {
                    width: 250
                    height: 32
                    border.width: 1
                    radius: 5

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 5

                        Label {
                            id: playerOne
                            text: "Human"
                        }

                        Label {
                            id: choiceOne
                            text: "O"
                        }
                    }
                }

                Rectangle {
                    width: 250
                    height: 32
                    border.width: 1
                    radius: 5

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 5

                        Label {
                            id: playerTwo
                            text: "Computer"
                        }

                        Label {
                            id: choiceTwo
                            text: "X"
                        }
                    }
                }
            }
        }

        ColumnLayout {
            spacing: 0

            Text {
                id: gameTimer
                Layout.alignment: Qt.AlignRight
                text: "00:00:00"
            }

            GridLayout {
                columns: 3
                rowSpacing: 0
                columnSpacing: 11

                Repeater {
                    model: 9

                    Button {
                        Layout.preferredWidth: 80
                        Layout.preferredHeight: 80
                        text: ticTacToe.board[index]
                        font.pixelSize: 25
                        onClicked: ticTacToe.makeMove(index)
                        enabled: ticTacToe.gameStatus === "Game in progress"
                    }
                }
            }
        }
    }
}
