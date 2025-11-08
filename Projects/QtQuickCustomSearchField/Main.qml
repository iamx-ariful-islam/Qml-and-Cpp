import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Custom Search Field")

    property list<string> itemList: ['Item', 'Item1', 'abc', 'TEST', 'Xyz']

    function onActionEvent(text) {
        searchText.text = text
        searchPopup.close()
    }

    function filterModel(searchItem) {
        var filteredItemList = []
        for (var i = 0; i < itemList.length; i++) {
            if (searchItem === "" || itemList[i].toLowerCase().indexOf(searchItem.toLowerCase()) === 0) {
                filteredItemList.push(itemList[i]);
            }
        }
        return filteredItemList
    }


    TextField {
        id: searchText
        placeholderText: qsTr('Search')
        implicitWidth: 150
        implicitHeight: 35
        font.bold: true
        font.pointSize: 8
        onTextChanged: {
            if (text.length > 0) {
                searchListView.model = filterModel(searchText.text)
                searchPopup.open()
            }
            else { searchPopup.close() }
        }
        Keys.forwardTo: [searchListView.currentItem, searchListView]
    }
    Popup {
        id: searchPopup
        y: searchText.height + 2
        width: searchText.width
        contentHeight: searchListView.contentHeight

        clip: true
        padding: 0
        ListView {
            id: searchListView
            currentIndex: 0
            anchors.fill: parent
            model: itemList
            delegate: ItemDelegate {
                text: modelData
                width: searchPopup.width
                height: searchText.height
                highlighted: index === searchListView.currentIndex
                HoverHandler {
                    cursorShape: Qt.PointingHandCursor
                }
                contentItem: Text {
                    text: modelData
                    font: searchText.font
                    color: Material.accent
                    elide: Text.ElideRight
                    verticalAlignment: Text.AlignVCenter
                }
                Keys.onReturnPressed: onActionEvent(text)
                onClicked: onActionEvent(text)
            }
        }
    }
}
