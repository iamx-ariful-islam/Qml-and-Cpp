import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


ApplicationWindow {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Signals & Connection")

    property Page1 page1: Page1{};
    property Page2 page2: Page2{};

    Component.onCompleted: {
        page2.buttonClicked.connect(function(buttonId) {
            page1.myText.text = buttonId;
            myStackView.pop();
        });
    }

    StackView {
        id: myStackView
        anchors.fill: parent
        initialItem: page1
    }
}
