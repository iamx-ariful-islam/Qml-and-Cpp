import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material


ApplicationWindow {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Tumbler")


    Row {
        anchors.centerIn: parent
        Tumbler {
            id: tumbler1
            model: 32
            font.pointSize: 15
            font.bold: true
        }
        Tumbler {
            id: tumbler2
            model: 13
            font.pointSize: 15
            font.bold: true
        }
        Tumbler {
            id: tumbler3
            model: [2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024]
            font.pointSize: 15
            font.bold: true
        }
    }
}
