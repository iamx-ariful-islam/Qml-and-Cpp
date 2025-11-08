import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material
import com.company.person 1.0


ApplicationWindow {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Register Type")

    Person {
        id: fPerson
        name: "test name"
        age: 22
        salary: 250.50
    }
    Person {
        id: sPerson
        name: "test second"
        age:  34
        salary: 230
    }
    Person {
        id: tPerson
        name: "test third"
        age:  24
        salary: 430
    }

    property var myModel: [fPerson, sPerson, tPerson]

    ListView {
        anchors.fill: parent
        model: myModel
        delegate: Rectangle {
            width: parent.width
            height: 50
            color: "green"
            radius: 5
            Text {
                id: myText
                color: "white"
                font.pointSize: 15
                font.bold: true
                anchors.centerIn: parent
                text: qsTr(modelData.name + ", " + modelData.age + ", " + modelData.salary)
            }
        }
        spacing: 10
    }
}
