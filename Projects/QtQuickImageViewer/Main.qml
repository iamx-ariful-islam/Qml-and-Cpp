import QtQuick
import QtQuick.Window
import QtQuick.Dialogs
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Image Viewer")


    BusyIndicator {
        id: busy;
        running: false;
        anchors.centerIn: parent;
        z: 2;
    }

    Text {
        id: stateLabel;
        visible: false;
        anchors.centerIn: parent;
        z: 3;
    }

    Image {
        id: imageViewer;
        asynchronous: true;
        anchors.fill: parent;
        fillMode: Image.PreserveAspectFit;
        onStatusChanged: {
            if(imageViewer.status === Image.Loading){
                busy.running = true;
                stateLabel.visible = false;
            }
            else if(imageViewer.status === Image.Ready){
                busy.running = false;
            }
            else if(imageViewer.status === Image.Error){
                busy.running = false;
                stateLabel.visible = true;
                stateLabel.text = "ERROR";
            }
        }
    }

    Button {
        id: openFile;
        text: "Open";
        anchors.left: parent.left;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 8;

        onClicked: fileDialog.open();
        z: 4;
    }

    Text {
        id: imagePath;
        anchors.left: openFile.right;
        anchors.leftMargin: 8;
        anchors.verticalCenter: openFile.verticalCenter;
        font.pixelSize: 15;
    }

    FileDialog {
        id: fileDialog;
        title: "Please choose a file";
        nameFilters: ["Image Files *(*.jpg *.png *gif)"];
        onAccepted: {
            imageViewer.source = fileDialog.selectedFile
            imagePath.text = fileDialog.selectedFile
        }
    }
}
