import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Calendar")


    ListView {
        id: listview
        anchors.centerIn: parent

        width: 200
        height: 200
        snapMode: ListView.SnapOneItem
        orientation: ListView.Horizontal
        highlightRangeMode: ListView.StrictlyEnforceRange

        model: CalendarModel {
            from: new Date(2024, 0, 1) // new Date(2024, 0)
            to: new Date(2024, 0, 31)  // new Date(2024, 0)
        }

        delegate: MonthGrid {
            width: listview.width
            height: listview.height

            month: model.month
            year: model.year
            locale: Qt.locale("en_US")
        }

        ScrollIndicator.horizontal: ScrollIndicator { }
    }
}
