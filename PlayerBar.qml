import QtQuick 2.0
Item {
    property alias widthBar: bar.width
    property alias heightBar: bar.height
    Rectangle {
        id: bar
        anchors.fill: parent
        border.color: "black"
        Text {
            id: name
            text: qsTr("text")
        }
    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
