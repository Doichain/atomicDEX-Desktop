import QtQuick 2.12

import App 1.0
import Dex.Themes 1.0 as Dex
import AtomicDEX.MarketMode 1.0 as Dex
import "../../Components"

Rectangle
{
    property int    marketMode: Dex.MarketMode.Sell
    property string ticker: ""

    width: 124
    height: 48
    radius: 18

    gradient: Gradient
    {
        orientation: Qt.Horizontal
        GradientStop
        {
            color: marketMode == Dex.MarketMode.Sell ?
                       Dex.CurrentTheme.tradeSellModeSelectorBackgroundColorStart :
                       Dex.CurrentTheme.tradeBuyModeSelectorBackgroundColorStart
            position: 0
        }

        GradientStop
        {
            color: marketMode == Dex.MarketMode.Sell ?
                       Dex.CurrentTheme.tradeSellModeSelectorBackgroundColorEnd :
                       Dex.CurrentTheme.tradeBuyModeSelectorBackgroundColorEnd
            position: 1
        }
    }

    DefaultRectangle
    {
        anchors.centerIn: parent
        width: parent.width - 2
        height: parent.height - 2
        radius: parent.radius - 1
        //color: Dex.CurrentTheme.tradeMarketModeSelectorNotSelectedBackgroundColor
        visible: API.app.trading_pg.market_mode != marketMode
    }

    DefaultText
    {
        anchors.centerIn: parent
        opacity: API.app.trading_pg.market_mode == marketMode ? 1 : 0.69
        text: (marketMode == Dex.MarketMode.Sell ? qsTr("Sell") : qsTr("Buy")) + ` ${ticker}`
    }

    DefaultMouseArea
    {
        anchors.fill: parent
        enabled: API.app.trading_pg.market_mode != marketMode
        onClicked: API.app.trading_pg.market_mode = marketMode
    }
}