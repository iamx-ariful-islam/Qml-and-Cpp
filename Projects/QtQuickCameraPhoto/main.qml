import QtQuick
import QtQuick.Controls
import QtMultimedia
import QtQuick.Layouts
import QtQuick.Controls.Material

import backend


ApplicationWindow {
    visible: true
    width: 850
    height: 500
    title: qsTr("Qt Quick Camera Photo")


    Backend { id: backend }

    MediaDevices { id: mediaDevices }

    function hasAnyCameras() {
        if (mediaDevices.videoInputs.length === 0) {
            statusText.text = "No camera detected"
            captureButton.enabled = false
            return false
        }
        return true
    }


    ColumnLayout {
        spacing: 10
        anchors.centerIn: parent

        Rectangle {
            width: 550
            height: 400
            border.width: 1
            radius: 8

            CaptureSession {
                id: captureSession
                camera: Camera {
                    id: camera
                    active: true
                    cameraDevice: mediaDevices.defaultVideoInput
                }
                videoOutput: videoOutput
            }

            VideoOutput {
                id: videoOutput
                anchors.fill: parent
                visible: camera.cameraStatus === Camera.ActiveStatus
            }

            Label {
                id: statusText
                text: camera.cameraStatus === Camera.ActiveStatus
                      ? "Camera ready"
                      : camera.cameraError === Camera.NoError
                        ? "Initializing..."
                        : "Error: " + camera.errorString
                color: "white"
                font.bold: true
                style: Text.Outline
                styleColor: "black"
            }
        }

        RowLayout {
            spacing: 5

            ComboBox {
                id: cameraSelector
                model: mediaDevices.videoInputs
                textRole: "description"
                //visible: count > 1
                onActivated: camera.cameraDevice = mediaDevices.videoInputs[currentIndex]
                Layout.fillWidth: true
                implicitHeight: 32
            }

            TextField {
                id: pid
                placeholderText: qsTr('Enter photo Id')
                implicitWidth: 150
                implicitHeight: 32
                onEditingFinished: {
                    backend.patientId = pid.text
                }
            }

            Button {
                id: captureButton
                text: "Take Photo"
                highlighted: true
                onClicked: {
                    backend.captureImage();
                    statusText.text = "Capturing...";
                }
                implicitWidth: 150
                implicitHeight: 42
            }
        }
    }

    Component.onCompleted: {
        if (hasAnyCameras()) {
            backend.setCaptureSession(captureSession);
        }
    }
}
