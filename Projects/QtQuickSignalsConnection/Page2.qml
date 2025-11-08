import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material



Page {
    signal buttonClicked(var buttonId)

    Component.onCompleted: {
        button1.clicked.connect(function() {
            buttonClicked(1);
        });
        button2.clicked.connect(function() {
            buttonClicked(2);
        });
        button3.clicked.connect(function() {
            buttonClicked(3);
        });
        button4.clicked.connect(function() {
            buttonClicked(4);
        });
        button5.clicked.connect(function() {
            buttonClicked(5);
        });
    }

    ColumnLayout {
        spacing: 5
        anchors.fill: parent
        Button {
            id: button1
            Layout.fillWidth: true
            Layout.fillHeight: true
            text: qsTr("Option 1")
        }
        Button {
            id: button2
            Layout.fillWidth: true
            Layout.fillHeight: true
            text: qsTr("Option 2")
        }
        Button {
            id: button3
            Layout.fillWidth: true
            Layout.fillHeight: true
            text: qsTr("Option 3")
        }
        Button {
            id: button4
            Layout.fillWidth: true
            Layout.fillHeight: true
            text: qsTr("Option 4")
        }
        Button {
            id: button5
            Layout.fillWidth: true
            Layout.fillHeight: true
            text: qsTr("Option 5")
        }
    }
}
