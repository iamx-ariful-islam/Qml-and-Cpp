import QtQuick
import QtQuick.Controls


Switch {
    id: lblSwitch

    property bool switchStatus: false

    checked: switchStatus

    indicator: Rectangle {
        implicitWidth: 40
        implicitHeight: 20
        x: lblSwitch.leftPadding
        y: parent.height / 2 - height / 2
        radius: 10
        color: lblSwitch.checked ? "#17a81a" : "#ffffff"
        border.color: lblSwitch.checked ? "#17a81a" : "#cccccc"

        Rectangle {
            x: lblSwitch.checked ? parent.width - width : 0
            width: 20
            height: 20
            radius: 10
            color: lblSwitch.down ? "#cccccc" : "#ffffff"
            border.color: lblSwitch.checked ? (lblSwitch.down ? "#17a81a" : "#21be2b") : "#999999"
        }
    }
    HoverHandler {
        cursorShape: Qt.PointingHandCursor
    }
}
