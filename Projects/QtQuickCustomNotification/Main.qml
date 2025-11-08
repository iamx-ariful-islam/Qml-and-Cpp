import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Custom Notification")


    CustomNotification {
        id: notify
    }

    Column {
        Button {
            text: 'success'
            onClicked: {
                notify.notificationMsg('Success', 'This is success message', 'success')
            }
        }
        Button {
            text: 'warning'
            onClicked: {
                notify.notificationMsg('warning', 'This is warning message', 'warning')
            }
        }
        Button {
            text: 'error'
            onClicked: {
                notify.notificationMsg('error', 'This is error message', 'error')
            }
        }
        Button {
            text: 'nothing'
            onClicked: {
                notify.notificationMsg('message', 'This is message', 'message')
            }
        }
    }
}
