import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material


Page {
    property alias myText: myText;

    Button {
        id: button1
        text: qsTr("Open Page 2")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        onClicked: {
            myStackView.push(page2);
        }
    }
    Text {
        id: myText
        anchors.centerIn: parent
        font.bold: true
        font.pointSize: 150
    }
}
