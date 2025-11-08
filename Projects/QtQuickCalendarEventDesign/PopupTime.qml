import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Popup {
    id: root
    modal: true
    width: 205
    height: 235
    anchors.centerIn: parent

    property string timeTitle: ""
    property color fontColor: "black"
    property string selectedTime: ""


    signal timeSelected(string time, string position)

    function padWithZero(number) {
        return (number < 10) ? "0" + number : "" + number;
    }
    function captureSelectedTime() {
        selectedTime = [padWithZero(hoursTumbler.currentIndex + 1), padWithZero(minutesTumbler.currentIndex)].join(":") + ampmTumbler.model[ampmTumbler.currentIndex]
        timeSelected(selectedTime, timeTitle);
    }


    function formatText(count, modelData) {
        var data = count === 12 ? modelData + 1 : modelData;
        return data.toString().length < 2 ? "0" + data : data;
    }

    onClosed: {
        if (root.result === Popup.Accepted) root.captureSelectedTime();
        else root.selectedTime = "";
    }

    background: Rectangle { radius: 10 }

    FontMetrics {
        id: fontMetrics
        font {
            family: "Roboto"
            weight: Font.Bold
            pixelSize: 14
        }
    }

    Component {
        id: delegateComponent

        Label {
            text: formatText(Tumbler.tumbler.count, modelData)
            opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: fontMetrics.font.pixelSize * 1.25
            font.bold: true
            color: root.fontColor
        }
    }

    ColumnLayout {
        spacing: 0

        Text {
            Layout.alignment: Qt.AlignCenter
            text: qsTr(root.timeTitle) + " Time"
            font {
                family: "Roboto"
                weight: Font.Bold
                pixelSize: 15
            }
        }

        RowLayout {

            Tumbler {
                id: hoursTumbler
                model: 12
                delegate: delegateComponent
            }

            Tumbler {
                id: minutesTumbler
                model: 60
                delegate: delegateComponent
            }

            Tumbler {
                id: ampmTumbler
                model: ["AM", "PM"]
                delegate: delegateComponent
            }
        }
    }
}
