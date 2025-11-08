import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Popup Window")

    ColumnLayout {
        id: column
        width: 125
        height: 75
        anchors.centerIn: parent

        TextField {
            id: textField
            implicitWidth: 350
            placeholderText: 'Enter some text'
        }
        Button {
            id: button
            text: 'Click to open popup'
            onClicked: {
                myPopup.open()
            }
        }
    }
    Popup {
        id: myPopup
        anchors.centerIn: parent
        width: 350
        height: 250
        closePolicy: Popup.CloseOnEscape

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 10
            Text {
                text: textField.text
            }
            Button {
                text: 'Close'
                width: 100
                onClicked: {
                    myPopup.close()
                }
            }
        }
    }
}
