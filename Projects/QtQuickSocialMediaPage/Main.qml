import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 950
    height: 550
    visible: true
    title: qsTr("Qt Quick Social Media Page")

    property var infoList: [
        ["Facebook", "icons/facebook.png", "https://web.facebook.com/", "#3b5998"],
        ["YouTube", "icons/youtube.png", "https://www.youtube.com/", "red"],
        ["WhatsApp", "icons/whatsapp.png", "whatsapp.com", "#25D366"],
        ["Twitter", "icons/twitter.png", "https://twitter.com/?lang=en", "#1DA1F2"],
        ["LinkedIn", "icons/linkedin.png", "linkedin.com", "#0077b5"],
        ["Telegram", "icons/telegram.png", "telegram.com", "#229ED9"],
    ]

    Rectangle {
        width: parent.width * 0.9
        height: parent.height * 0.8
        anchors.centerIn: parent
        radius: 10
        // border.width: 1

        ColumnLayout {
            spacing: 15
            anchors.centerIn: parent

            Text {
                id: headerTitle
                Layout.alignment: Qt.AlignRight
                text: qsTr("Find us on")
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 16
                }
            }
            Text {
                id: headerSubTitle
                Layout.alignment: Qt.AlignRight
                text: qsTr("Contact with us by find on social media")
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 12
                }
                opacity: 0.5
            }

            GridLayout {
                rows: infoList.length
                columns: 2
                rowSpacing: 10
                columnSpacing: 10

                Repeater {
                    model: infoList.length

                    CustomAnimatedRectangle {
                        titleText: infoList[model.index][0]
                        iconSource: infoList[model.index][1]
                        infoUrl: infoList[model.index][2]
                        colorCode: infoList[model.index][3]
                    }
                }
            }

            Text {
                id: footer
                Layout.topMargin: 35
                text: "<p>JONAKI SOFT NETWORK AUTHORIZE NOTE<br/>If any query then contact us without any hesitation<br/><br/>+880 XXXXXXXXXX, +880 XXXXXXXXXX<br/>E-mail : ariful.cse08@gmail.com, jonakisoft.net@gmail.com</p>"
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                }
                textFormat: Text.RichText
                color: "gray"
            }
        }
    }
}
