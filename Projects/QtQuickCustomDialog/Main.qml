import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Custom Dialog")


    Button {
        anchors.centerIn: parent
        text: 'open'
        onClicked: {
            dialog.open()
        }
    }

    Dialog {
        id: dialog
        modal: true
        title: qsTr('This is title')
        font.bold: true
        anchors.centerIn: parent
        background: Rectangle {
            radius: 10
        }
        Column {
            Rectangle {
                implicitWidth: 400
                implicitHeight: 100
                Text {
                    font.bold: true
                    text: qsTr('this is dialog button')
                    anchors.centerIn: parent
                }
            }
            Button {
                id: btnOk
                focus: true
                text: 'close'
                function closeDialog(){
                    console.log('enter function')
                    dialog.close()
                    console.log('exit function')
                }
                onClicked: btnOk.closeDialog()
                Keys.onReturnPressed: btnOk.closeDialog()
                Keys.onEnterPressed: btnOk.closeDialog()
            }
        }
    }
}
