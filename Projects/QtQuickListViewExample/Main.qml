import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material
import Qt.labs.platform

import fileManageBackend 0.1

Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick List View Example(Images Viewer)")


    // custom property
    property var mylist : []
    property string folderpath: ""
    property var imageNameFilters : ["All image formats (*.png; *.jpg; *.bmp; *.gif; *.jpeg"]


    FileManageBackend {
        id: myFileManageBackend
    }


    Rectangle {
        id: mainBg
        anchors.fill: parent
        color: "#fff"

        Rectangle {
            id: listRect
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            height: 80
            width: 350
            border.color: "blue"
            border.width: 1
            radius: 10
            clip: true

            RowLayout {
                anchors.fill: parent
                anchors.margins: 10
                ListView {
                    id: mList
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    orientation: ListView.Horizontal
                    spacing: 3
                    model: mylist
                    clip: true

                    delegate: Rectangle {
                        height: 60
                        width: 60
                        radius: 3
                        color: mList.currentIndex === index ? "gray" : "transparent"
                        border.color: mList.currentIndex === index ? "black" : "transparent"

                        Image {
                            source: modelData
                            anchors.fill: parent
                            anchors.margins: 5
                            antialiasing: true
                            fillMode: Image.PreserveAspectFit
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log(index, modelData)
                                mList.currentIndex = index
                                mainImage.source = modelData
                                mainImage.playing = true
                            }
                        }
                    }
                }
            }
        }

        // Text
        Text {
            id: myText
            anchors.left: listRect.right
            anchors.verticalCenter: listRect.verticalCenter
            color: "blue"
            font {
                family: "Roboto"
                weight: Font.Bold
                pixelSize: 14
            }
        }

        ColumnLayout {
            anchors.right: listRect.left
            anchors.rightMargin: 10
            anchors.bottom: listRect.bottom
            height: listRect.height
            spacing: 0

            RoundButton {
                id: myBtnRect
                text: "Load Images"
                implicitWidth: 140
                implicitHeight: 42
                font {
                    family: "Roboto"
                    weight: Font.Bold
                    pixelSize: 14
                }
                radius: 5

                onClicked: filesOpen.open()
            }

            RoundButton {
                id: removeButton
                text: "Remove"
                implicitWidth: 140
                implicitHeight: 42
                font {
                    family: "Roboto"
                    weight: Font.Bold
                    pixelSize: 14
                }
                radius: 5

                onClicked: {
                    mylist = myFileManageBackend.removeItems(mList.currentIndex)
                    myText.text = " Total images: " + mylist.length
                    mainImage.source = mylist[0]
                }
            }
        }

        AnimatedImage {
            id: mainImage
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            fillMode: Image.PreserveAspectFit
            anchors.leftMargin: 100
            anchors.rightMargin: 100
            anchors.topMargin: 100
            anchors.bottomMargin: 100
        }

        //File folder open
        FileDialog {
            id: filesOpen
            folder: folderpath
            fileMode: FileDialog.ReadOnly
            nameFilters: imageNameFilters
            title: "Select the image"
            onAccepted: {
                console.log(folderpath = folder)
                mylist = myFileManageBackend.fileSearch(folderpath = folder)
                myText.text = " Total images: " + mylist.length
                mainImage.source = mylist[0]
            }
        }
    }
}
