import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Color Gradient")

    ColumnLayout {
        width: parent.width
        height: parent.height

        Rectangle {
            width: parent.width
            height: 50
            gradient: "NightFade"
        }
        Rectangle {
            width: parent.width
            height: 50
            gradient: "RainyAshville"
        }
        Rectangle {
            width: parent.width
            height: 50
            gradient: "MalibuBeach"
        }
        Rectangle {
            width: parent.width
            height: 50
            gradient: "FrozenDreams"
        }
        Rectangle {
            width: parent.width
            height: 50
            gradient: Gradient {
                GradientStop { position: 0.0; color: "red" }
                GradientStop { position: 0.33; color: "yellow" }
                GradientStop { position: 1.0; color: "green" }
            }
        }
    }
}
