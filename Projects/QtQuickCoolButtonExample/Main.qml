import QtQuick
import QtQuick.Window

import Monty 1.0

Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Cool Button Example")


    ExampleClass {
            id: myClass
            onProcessing: customButton.state = "progress"
            onProcessComplete: customButton.state = "complete"
        }

        CustomButton {
            id: customButton
            anchors.centerIn: parent
            width: parent.width / 4
            height: parent.height / 6
            progress: myClass.exampleProgress
            onButtonClicked: myClass.beginProcess()
        }
}
