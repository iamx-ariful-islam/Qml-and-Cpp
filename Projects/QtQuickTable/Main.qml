import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.qmlmodels



ApplicationWindow {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Table")


    ScrollView {
        anchors.fill: parent
        TableView {
            id: tableView
            clip: true
            interactive: true
            rowSpacing: 1
            columnSpacing: 1
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
                implicitHeight: 50
                required property bool selected
                required property bool current
                border.width: current ? 2 : 0
                color: selected ? "lightblue" : 'green'//palette.base
                Text{
                    text: model.display
                    padding: 12
                }
            }
            Shortcut {
                sequence: StandardKey.Copy
                onActivated: {
                    let indexes = tableView.selectionModel.selectedIndexes
                    tableView.model.copyToClipboard(indexes)
                }
            }
            Shortcut {
                sequence: StandardKey.Paste
                onActivated: {
                    let targetIndex = tableView.selectionModel.currentIndex
                    tableView.model.pasteFromClipboard(targetIndex)
                }
            }
        }
    }
    SelectionRectangle {
        target: tableView
    }
}
