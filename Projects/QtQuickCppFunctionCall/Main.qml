import QtQuick
import QtQuick.Window
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Cpp Function Call")


    Button {
        anchors.centerIn: parent
        text: "Press me"
        onClicked: {
            console.log("Button clicked")
            objBackend.callFromQML()
        }
    }
}
