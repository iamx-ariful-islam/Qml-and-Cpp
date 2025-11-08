import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

import myBeckend

Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Number Guessing")


    MyBeckend {
        id: numberGame
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        Label {
            text: numberGame.message
            font.pixelSize: 18
        }


        RowLayout {
            spacing: 10

            ComboBox {
                id: guessOptions
                model: ["Easy", "Medium", "Hard", "Custom"]
                implicitWidth: 160
                implicitHeight: 32
            }

            TextField {
                id: guessValues
                enabled: guessOptions.currentIndex === 3
                placeholderText: enabled ? "Enter guess range" : ""
                text: enabled ? "" : ["1 to 100", "1 to 1000", "1 to 10000"][guessOptions.currentIndex]
                color: "green"
                implicitWidth: 160
                implicitHeight: 32
            }
        }

        TextField {
            id: guessInput
            placeholderText: "Enter Your Guess"
            implicitWidth: 330
            implicitHeight: 32
            validator: IntValidator {
                bottom: 1
                top: parseInt(guessValues.text.match(/\d+/g)?.pop()) || 100
            }
        }

        RowLayout {
            spacing: 5

            RoundButton {
                id: startButton
                text: "Start Game"
                implicitWidth: 120
                implicitHeight: 42
                radius: 5
                font { family: "roboto"; weight: Font.Bold; pixelSize: 12}
                onClicked: {
                    let range = (guessValues.text.match(/\d+/g) || [1, 100])
                    if (text === "Start Game") {
                        numberGame.startGame(...range)
                        text = "Reset Game"
                    } else {
                        numberGame.resetGame()
                        text = "Start Game"
                    }
                }
            }
            RoundButton {
                text: "Guessing"
                implicitWidth: 120
                implicitHeight: 42
                radius: 5
                font { family: "roboto"; weight: Font.Bold; pixelSize: 12}
                enabled: numberGame.attempts < 5 && startButton.text !== "Start Game"
                onClicked: numberGame.checkGuess(parseInt(guessInput.text))
            }

            Label {
                text: "Attempts: " + numberGame.attempts
                font { family: "roboto"; weight: Font.Bold; pixelSize: 14}
            }
        }
    }

    Rectangle {
        x: parent.width - width - 20
        width: 200
        height: parent.height * 0.8
        color: "lightgray"
        radius: 5

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Game History")
            font { family: "roboto"; weight: Font.Bold; pixelSize: 14}
        }
        anchors.verticalCenter: parent.verticalCenter
    }
}
