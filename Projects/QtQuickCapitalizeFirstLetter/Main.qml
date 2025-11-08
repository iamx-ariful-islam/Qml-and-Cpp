import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Capitalize First Letter")


    function capitalizeFirstLetter() {
        let strText = inputText.text.toLowerCase();
        return strText[0].toUpperCase() + strText.slice(1);
    }


    Column {
        anchors.centerIn: parent
        spacing: 10

        Row {
            spacing: 10

            TextField {
                id: inputText
                implicitWidth: 350
            }
            Button {
                id: convert
                text: "Convert"
                onClicked: {
                    showText.text = capitalizeFirstLetter()
                }
            }
        }
        Label {
            id: showText
        }
    }
}
