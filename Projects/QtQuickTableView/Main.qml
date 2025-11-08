import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material
import Qt.labs.qmlmodels


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Table View")

    ScrollView {
        anchors.fill: parent

        TableView {
            id: tableView
            clip: true
            interactive: true
            boundsBehavior: Flickable.StopAtBounds

            model: TableModel {
                TableModelColumn { display: "checked" }
                TableModelColumn { display: "amount" }
                TableModelColumn { display: "fruitType" }
                TableModelColumn { display: "fruitName" }
                TableModelColumn { display: "fruitPrice" }

                rows: [
                    {
                        checked: false,
                        amount: 1,
                        fruitType: "Apple",
                        fruitName: "Granny Smith",
                        fruitPrice: 1.50
                    },
                    {
                        checked: true,
                        amount: 4,
                        fruitType: "Orange",
                        fruitName: "Navel",
                        fruitPrice: 2.50
                    },
                    {
                        checked: false,
                        amount: 1,
                        fruitType: "Banana",
                        fruitName: "Cavendish",
                        fruitPrice: 3.50
                    }
                ]
            }
            selectionModel: ItemSelectionModel {}
            delegate: Rectangle {
                implicitWidth: 100
                implicitHeight: 28
                required property bool selected
                required property bool current
                border.width: 0.5
                border.color: selected ? Material.accentColor : "lightgray"
                color: selected ? "lightblue" : palette.base
                Text{
                    text: model.display
                    padding: 12
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
    }
    SelectionRectangle {
        target: tableView
    }
}
