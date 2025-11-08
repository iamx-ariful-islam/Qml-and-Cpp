import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material

import "./ExpandableBottomBar"


Window {
    id: root
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Animated Tab Bar")

    color: "#F9D8E6"

    NavigationBar {
        anchors {
            left: parent.left
            leftMargin: 50
            right: parent.right
            rightMargin: 50
            bottom: parent.bottom
            bottomMargin: 50
        }

        NavigationBarButton {
            text: "Home"
            icon.source: "../assets/home.png"
            palette {
                buttonText: "#969696"
                highlight: "#FBE5EE"
                highlightedText: "#EE7CA4"
            }
            onCheckedChanged: {
                if (checked) {
                    root.color = palette.highlight
                }
            }
        }

        NavigationBarButton {
            text: "Today"
            icon.source: "../assets/sun.png"
            palette {
                buttonText: "#969696"
                highlight: "#dfdfdf"
                highlightedText: "#888888"
            }
            onCheckedChanged: {
                if (checked) {
                    root.color = palette.highlight
                }
            }
        }

        NavigationBarButton {
            text: "Done"
            icon.source: "../assets/check.png"
            palette {
                buttonText: "#969696"
                highlight: "#fbe8e7"
                highlightedText: "#f08e8b"
            }
            onCheckedChanged: {
                if (checked) {
                    root.color = palette.highlight
                }
            }
        }

        NavigationBarButton {
            text: "Settings"
            icon.source: "../assets/settings.png"
            palette {
                buttonText: "#969696"
                highlight: "#dcebfb"
                highlightedText: "#56a2ec"
            }
            onCheckedChanged: {
                if (checked) {
                    root.color = palette.highlight
                }
            }
        }
    }
}
