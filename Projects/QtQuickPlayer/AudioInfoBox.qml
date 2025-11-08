import QtQuick

Item {
    id: root

    required property int songIndex
    property alias title: titleText.text
    property alias authorName: authorText.text
    property alias imageColor: albumImage.color

    visible: playerController.currentSongIndex === root.songIndex

    Rectangle {
        id: albumImage
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
        }
        width: 120
        height: 110
        radius: 10
    }
    Text {
        id: titleText
        anchors {
            bottom: parent.verticalCenter
            left: albumImage.right
            margins: 15
        }
        color: 'white'
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        font {
            pixelSize: 20
            bold: true
        }
    }
    Text {
        id: authorText
        anchors {
            top: parent.verticalCenter
            left: titleText.left
            right: parent.right
        }
        color: "gray"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        font {
            pixelSize: 16
        }
    }
}
