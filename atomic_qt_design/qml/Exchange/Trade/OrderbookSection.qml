import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

import "../../Components"
import "../../Constants"

// Open Enable Coin Modal
ColumnLayout {
    id: root

    property bool is_asks: false
    property alias model: list.model
    function chooseOrder(order) {
        // Choose this order
        selectOrder(order)
    }

    // List header
    Item {
        Layout.fillWidth: true

        height: 50

        // Price
        DefaultText {
            id: price_header
            font.pixelSize: Style.textSizeSmall2

            text_value: API.get().empty_string + (is_asks ? qsTr("Ask Price") + " (" + model.length + ")" :
                                                            "(" + model.length + ") " + qsTr("Bid Price"))

            color: is_asks ? Style.colorRed : Style.colorGreen

            anchors.left: is_asks ? parent.left : undefined
            anchors.right: is_asks ? undefined : parent.right
            anchors.leftMargin: is_asks ? parent.width * 0.02 : undefined
            anchors.rightMargin: is_asks ? undefined : parent.width * 0.02

            anchors.verticalCenter: parent.verticalCenter
        }

        // Quantity
        DefaultText {
            id: quantity_header
            anchors.left: is_asks ? parent.left : undefined
            anchors.right: is_asks ? undefined : parent.right
            anchors.leftMargin: is_asks ? parent.width * 0.3 : undefined
            anchors.rightMargin: is_asks ? undefined : parent.width * 0.3

            font.pixelSize: price_header.font.pixelSize

            text_value: API.get().empty_string + (qsTr("Quantity"))
            color: Style.colorWhite1
            anchors.verticalCenter: parent.verticalCenter
        }

        // Total
        DefaultText {
            id: total_header
            anchors.left: is_asks ? parent.left : undefined
            anchors.right: is_asks ? undefined : parent.right
            anchors.leftMargin: is_asks ? parent.width * 0.6 : undefined
            anchors.rightMargin: is_asks ? undefined : parent.width * 0.6

            font.pixelSize: price_header.font.pixelSize

            text_value: API.get().empty_string + (qsTr("Total"))
            color: Style.colorWhite1
            anchors.verticalCenter: parent.verticalCenter
        }

        // Line
        HorizontalLine {
            width: parent.width
            color: Style.colorWhite5
            anchors.bottom: parent.bottom
        }
    }

    // List
    DefaultListView {
        id: list

        scrollbar_visible: false

        Layout.fillWidth: true
        Layout.fillHeight: true

        delegate: Rectangle {
            color: mouse_area.containsMouse ? Style.colorTheme4 : "transparent"

            width: root.width
            height: 50

            MouseArea {
                id: mouse_area
                anchors.fill: parent
                hoverEnabled: true
                //onClicked: chooseOrder(model.modelData)
            }

            // Price
            DefaultText {
                id: price_value

                anchors.left: is_asks ? parent.left : undefined
                anchors.right: is_asks ? undefined : parent.right
                anchors.leftMargin: price_header.anchors.leftMargin
                anchors.rightMargin: price_header.anchors.rightMargin

                font.pixelSize: Style.textSizeSmall1

                text_value: API.get().empty_string + (General.formatDouble(price))
                color: price_header.color
                anchors.verticalCenter: parent.verticalCenter
            }

            // Quantity
            DefaultText {
                id: quantity_value
                anchors.left: is_asks ? parent.left : undefined
                anchors.right: is_asks ? undefined : parent.right
                anchors.leftMargin: quantity_header.anchors.leftMargin
                anchors.rightMargin: quantity_header.anchors.rightMargin

                font.pixelSize: price_value.font.pixelSize

                text_value: API.get().empty_string + (quantity)
                color: Style.colorWhite4
                anchors.verticalCenter: parent.verticalCenter
            }

            // Total
            DefaultText {
                id: total_value
                anchors.left: is_asks ? parent.left : undefined
                anchors.right: is_asks ? undefined : parent.right
                anchors.leftMargin: total_header.anchors.leftMargin
                anchors.rightMargin: total_header.anchors.rightMargin

                font.pixelSize: price_value.font.pixelSize

                text_value: API.get().empty_string + (total)
                color: Style.colorWhite4
                anchors.verticalCenter: parent.verticalCenter
            }

            // Line
            HorizontalLine {
                visible: index !== root.model.length - 1
                width: parent.width
                color: Style.colorWhite9
                anchors.bottom: parent.bottom
            }
        }
    }
}
