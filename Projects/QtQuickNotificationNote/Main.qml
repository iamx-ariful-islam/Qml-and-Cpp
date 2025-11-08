import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Notification Note")


    CustomNotificationMsg {
        anchors.centerIn: parent
        notificationText: "This is the long text and this text is wrap text but this is the example text"
        // call the showNotification function to display the notification with animation
        Component.onCompleted: showNotification()
    }
}
