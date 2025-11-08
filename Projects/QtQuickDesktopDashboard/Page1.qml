import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material


Page1Form {
    button1.onClicked: {
        console.log("Button Pressed. Entered text: " + textField1.text);
    }
}
