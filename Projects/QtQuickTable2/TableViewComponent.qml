import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Qt.labs.qmlmodels


Item {
    id: control

    property var title: title
    property int boundsBehavior: Flickable.StopAtBounds

    property int columnSpacing: 20
    property int rowSpacing: 5

    property var headers: tableHeaders.model
    property alias model: tableView.model
    property alias delegate: tableView.delegate

    property alias horizontalLine: horizontalLine
    property alias scrollView: scrollView

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        RowLayout{
            Text {
                id: title
                text: qsTr("Table Title")
                visible: text.length !== 0
                font.pixelSize: 13
                font.bold: true
            }
            Item {
                Layout.fillHeight: false
                Layout.fillWidth: true
            }
        }

        HorizontalHeaderView {
            id: tableHeaders
            syncView: tableView

            delegate: Item {
                Text {
                    visible: modelData.text.length !== 0
                    text: modelData.text
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }

        Rectangle {
            id: horizontalLine
            border.color: "black"

            Layout.fillWidth: true
            Layout.preferredHeight: 2
        }

        ScrollView {
            id: scrollView
            Layout.fillWidth: true
            Layout.preferredHeight: control.height - tableHeaders.height
            clip: true

            ScrollBar.vertical.policy: ScrollBar.AlwaysOn

            TableView {
                id: tableView

                columnSpacing: control.columnSpacing
                rowSpacing: control.rowSpacing

                boundsBehavior: control.boundsBehavior
                contentWidth: control.width
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
