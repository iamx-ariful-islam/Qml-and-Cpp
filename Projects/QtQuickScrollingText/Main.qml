import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material

import myBackend

Window {
    width: 850
    height: 550
    visible: true
    title: qsTr("Qt Quick Scrolling Text")


    MyBackend {
        id: backend
    }


    ColumnLayout {
        y: 50
        spacing: 150

        Rectangle {
            width: 850
            height: 50

            // scrollView container for scrolling text
            ScrollView {
                id: scrollingFrame
                width: parent.width
                height: parent.height

                ScrollBar.vertical: ScrollBar { policy: ScrollBar.AlwaysOff }
                ScrollBar.horizontal: ScrollBar { policy: ScrollBar.AlwaysOff }

                // text element displaying the scrolling text
                Text {
                    id: scrollingText
                    text: backend.scrollingText  // binding text from C++ object
                    font {
                        family: "ubuntu"
                        weight: Font.Bold
                        pixelSize: 20
                    }
                    color: "orange"

                    // timer to animate the text scroll
                    Timer {
                        id: scrollTimer
                        interval: 30
                        running: true
                        repeat: true

                        onTriggered: {
                            scrollingText.x -= 2;  // move text leftward, adjust speed here
                            if (scrollingText.x + scrollingText.width < 0) {
                                scrollingText.x = scrollingFrame.width // reset position when text goes off-screen
                            }
                        }
                    }
                }
            }
        }

        RowLayout {
            spacing: 20
            Layout.alignment: Qt.AlignHCenter

            TextField {
                id: newScrollingText
                placeholderText: "Enter new scrolling text"
                implicitWidth: 350
                implicitHeight: 32
            }
            Button {
                text: qsTr("Add New")
                onClicked: {
                    backend.addText(newScrollingText.text)
                }
            }
        }
    }

    Component.onCompleted: {
        scrollingText.x = scrollingFrame.width
    }
}
