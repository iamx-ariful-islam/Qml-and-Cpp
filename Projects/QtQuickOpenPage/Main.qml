import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 800
    height: 500
    visible: true
    title: qsTr("Qt Quick Open Page")

    property string appVersion: "v2025.1"
    property string changeText: "hospital"
    property bool showLoader: false   // control BusyIndicator


    Rectangle {
        id: openPage
        anchors.centerIn: parent
        width: parent.width * 0.5
        height: parent.height * 0.5
        opacity: 1    // start visible

        ColumnLayout {
            spacing: 20
            anchors.centerIn: parent

            RowLayout {
                spacing: 10

                Rectangle {
                    id: iconImage // icon image change base on active type like as- pathology, billing, medical store, prescription, connector
                    width: 55
                    height: 51
                    radius: 8
                    border.color: "whitesmoke"
                    opacity: 0
                    x: 50   // start slightly right

                    SequentialAnimation on opacity {
                        running: true
                        ParallelAnimation {
                            NumberAnimation { target: iconImage; property: "x"; to: 0; duration: 500; easing.type: Easing.OutCubic }
                            NumberAnimation { target: iconImage; property: "opacity"; to: 1; duration: 500 }
                        }
                        onStopped: showLoader = true   // start loader after animation
                    }

                    Text {
                        anchors.centerIn: parent
                        id: iconText
                        text: qsTr("H") // moto or sub-title change base on active type like as- pathology, billing, medical store, prescription, connector
                        font.family: "ubuntu"
                        font.weight: Font.Bold
                        font.pixelSize: 48
                        opacity: 0
                        x: -50
                        scale: 0    // start scaled down

                        SequentialAnimation {
                            running: true
                            PauseAnimation { duration: 100 }   // slight delay for smoothness
                            ParallelAnimation {
                                NumberAnimation { target: iconText; property: "scale"; from: 0; to: 1; duration: 500; easing.type: Easing.OutBack }
                                NumberAnimation { target: iconText; property: "opacity"; from: 0; to: 1; duration: 500 }
                            }
                        }
                    }
                }

                ColumnLayout {
                    spacing: 0

                    Text {
                        id: titleText
                        text: qsTr("eSmart Hospital Management") // title change base on active type like as- pathology, billing, medical store, prescription, connector
                        font.family: "ubuntu"
                        font.weight: Font.Bold
                        font.pixelSize: 28
                        opacity: 0
                        x: -50

                        SequentialAnimation on opacity {
                            running: true
                            ParallelAnimation {
                                NumberAnimation { target: titleText; property: "x"; to: 0; duration: 500; easing.type: Easing.OutCubic }
                                NumberAnimation { target: titleText; property: "opacity"; to: 1; duration: 500 }
                            }
                        }
                    }

                    Text {
                        id: subtitleText
                        text: qsTr(`Manage your entire ${changeText} system | ${appVersion}`) // moto or sub-title change base on active type like as- pathology, billing, medical store, prescription, connector
                        font.family: "roboto"
                        font.weight: Font.Bold
                        font.pixelSize: 15
                        opacity: 0
                        x: -50

                        SequentialAnimation on opacity {
                            running: true
                            PauseAnimation { duration: 100 }   // shorter wait
                            ParallelAnimation {
                                NumberAnimation { target: subtitleText; property: "x"; to: 0.0; duration: 500; easing.type: Easing.OutCubic }
                                NumberAnimation { target: subtitleText; property: "opacity"; to: 0.5; duration: 500 }
                            }
                        }
                    }
                }
            }
            // BusyIndicator with fixed space & fade effect
            BusyIndicator {
                id: loader
                visible: true
                running: showLoader
                Layout.alignment: Qt.AlignHCenter
                opacity: showLoader ? 1 : 0   // fade in/out
                Behavior on opacity { NumberAnimation { duration: 400; easing.type: Easing.InOutQuad }}
            }
        }
    }


    Rectangle {
        id: loginPage
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        visible: true
        opacity: 0    // hidden initially

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 10

            TextField {
                id: userName
                placeholderText: qsTr("Enter username")
                implicitWidth: 320
                implicitHeight: 32
                font.family: "roboto"
                font.weight: Font.Bold
                font.pixelSize: 12
            }

            TextField {
                id: userPassword
                placeholderText: qsTr("Enter user password")
                implicitWidth: 320
                implicitHeight: 32
                font.family: "roboto"
                font.weight: Font.Bold
                font.pixelSize: 12
                echoMode: TextField.Password
            }

            RoundButton {
                id: btnLogin
                text: qsTr("Login")
                implicitWidth: 120
                implicitHeight: 45
                radius: 8
                font.family: "roboto"
                font.weight: Font.Bold
                font.pixelSize: 14
                onClicked: console.log("button clicked")
            }
        }
    }

    SequentialAnimation {
        running: true
        PauseAnimation { duration: 5000 }   // loading time
        ScriptAction { script: fadeTransition.start() }
    }

    ParallelAnimation {
        id: fadeTransition
        //NumberAnimation { target: openPage; property: "opacity"; to: 0; duration: 800; easing.type: Easing.OutCubic }
        NumberAnimation { target: loginPage; property: "opacity"; to: 1; duration: 800; easing.type: Easing.InCubic }
    }
}
