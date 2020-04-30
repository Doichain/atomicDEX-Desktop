import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtGraphicalEffects 1.0
import "../Constants"

// Add button
Item {
    property alias mouse_area: mouse_area

    width: 50
    height: width

    Rectangle {
        id: add_coin_button

        anchors.fill: parent
        anchors.margins: 1

        color: mouse_area.containsMouse ? Style.colorTheme7 : Style.colorTheme8
        border.color: Style.colorThemeDark
        border.width: 1
        radius: 100

        Rectangle {
            id: vline
            width: parent.border.width*2
            height: parent.width * 0.30
            radius: parent.radius
            color: mouse_area.containsMouse ? Style.colorThemePassiveLight : Style.colorThemePassive
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            width: vline.height
            height: vline.width
            radius: parent.radius
            color: vline.color
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

        MouseArea {
            id: mouse_area
            anchors.fill: parent
            hoverEnabled: true
        }
    }

    DropShadow {
        anchors.fill: add_coin_button
        source: add_coin_button
        cached: false
        horizontalOffset: 0
        verticalOffset: 0
        radius: 16
        samples: 32
        spread: 0
        color: "#20000000"
        smooth: true
    }
}
