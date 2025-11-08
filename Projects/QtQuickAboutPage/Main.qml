import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 950
    height: 480
    visible: true
    title: qsTr("Qt Quick About Page")


    Rectangle {
        anchors.centerIn: parent
        color: "#1d2128"
        radius: 10
        width: parent.width - 50
        height: 250

        ScrollView {
            id: scrollView
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            clip: true
            anchors.rightMargin: 10
            anchors.leftMargin: 15
            anchors.bottomMargin: 10
            anchors.topMargin: 20
            font.family: "Roboto"

            Text {
                id: textHome
                color: "#a9b2c8"
                text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'Roboto'; font-size:8.25pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-weight:600;\">JONAKI SOFT NETWORK AUTHORIZE LICENSE</span></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Version v2023, 25 January 2024</p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Copyright (c) 2023-2024 All rights reserved | <span style=\" font-weight:600;\">Jonaki Soft Network</span></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-weight:600;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-weight:600; color:#55aaff;\">Attention</span>: This project was created with the Open Souce tools from Qt Company,</p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">this project can be used for studies or personal non-commercial projects. </p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-weight:600;\">If you are going to use it for </span><span style=\" font-weight:600; color:#55aaff;\">commercial use</span><span style=\" font-weight:600;\">, you need to purchase a license at &quot;https://www.qt.io&quot;</span></p></body></html>"
                anchors.fill: parent
                font.pixelSize: 12
                textFormat: Text.RichText
            }
            Label {
                id: version
                x: parent.width - width - 5
                font {
                    weight: Font.Bold
                    pixelSize: 18
                }
                text: qsTr("v23.1")
                color: "white"
            }
            Label {
                x: parent.width - width - 5
                anchors.top: version.bottom
                text: qsTr("10:45:15pm")
                color: "white"
            }
            Label {
                y: parent.height - height
                text: qsTr("eSmart Analyzer LIS v2023.x1")
                font.bold: true
                color: "white"
            }
            Label {
                x: parent.width - width
                y: parent.height - height
                text: qsTr("Previous >>")
                font.bold: true
                color: "white"
            }
        }
    }
}
