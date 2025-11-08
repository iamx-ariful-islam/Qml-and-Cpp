import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material

import MyDatabase 0.1

Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick SQLite Example")


    MyDatabase {
        id: db_action
    }

    ColumnLayout {
        spacing: 10
        anchors.centerIn: parent

        TextField {
            id: name
            implicitWidth: 350
            placeholderText: qsTr("Name")
        }

        TextField {
            id: gender
            implicitWidth: 350
            placeholderText: qsTr("Gender")
        }

        TextField {
            id: age
            implicitWidth: 350
            placeholderText: qsTr("Age")
            validator: IntValidator {}
        }

        Button {
            text: "Add"
            onClicked: {
                // Call C++ function to add data to SQLite
                db_action.addData(name.text, gender.text, parseInt(age.text))
            }
        }
    }
}
