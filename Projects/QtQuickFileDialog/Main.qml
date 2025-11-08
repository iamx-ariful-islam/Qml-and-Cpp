import QtQuick
import QtQuick.Window
import QtQuick.Dialogs
import QtQuick.Controls
import QtQuick.Controls.Material



ApplicationWindow {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick FileDialog")

//    property var shortcut: {
//        home: "file:///path/to/home"
//    }

    FileDialog {
        id: openFileDialog
        title: "Open"
        currentFolder: shortcut.home
        nameFilters: ["All files (*)"]

        onAccepted: {
            fileName.text = selectedFile;
            fileName2.text = selectedFile;
        }
        onRejected: {
            fileName.text = "";
            fileName2.text = "";
        }
    }
    Column {
        anchors.centerIn: parent
        spacing: 10

        Button {
            text: qsTr("open")
            onClicked: {
                openFileDialog.open();
            }
        }
        TextField {
            id: fileName
            implicitWidth: 350
        }
    }

    Row {
        spacing: 10

        TextField {
            id: fileName2
            implicitWidth: 350
        }
        Button {
            text: "Browse"
            onClicked: openFileDialog.open()
        }
    }
}
