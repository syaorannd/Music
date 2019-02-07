import QtQuick 2.9
import QtQuick.Window 2.2
import QtMultimedia 5.0

Window {
    id: window
    visible: true
    width: 240
    height: 320
    title: qsTr("Music")
    property bool playing: false
    property bool showingMenu: false
    // Player Bar (S)
    Rectangle {
        id: playbar
        x: 0
        y: 440
        signal clickNext()
        signal clickPre()
        width: parent.width
        height: 40
        radius: 1
        MouseArea {
            anchors.fill: parent
            onClicked: {
                window.showingMenu = false
            }
        }

        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#bea4d7"
            }

            GradientStop {
                position: 1
                color: "#c0acd3"
            }
        }
        border.color: "#948686"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0

        Rectangle {
            id: rec_pre
            property bool isClick: false
            color: isClick ? "#CC99FF" : "#7a55d8"
            x: 39
            y: 8
            width: 24
            height: 24
            radius: 12
            border.color: "#967f7f"
            clip: true
            anchors.right: rec_play.left
            anchors.rightMargin: 15
            anchors.verticalCenter: parent.verticalCenter

            Image {
                id: img_pre
                x: 8
                y: 8
                width: 12
                height: 12
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "Resource/img/pre.png"
                fillMode: Image.PreserveAspectFit
            }
            MouseArea {
                id: ms_pre
                anchors.fill: parent
                onPressed: {
                    rec_pre.isClick = !rec_pre.isClick
                    console.log("Pre")
                    playbar.clickPre()
                    playing = false
                }
                onReleased: {
                    rec_pre.isClick = !rec_pre.isClick
                }
            }
        }

        Rectangle {
            id: rec_play
            property bool isClick: false
            x: 90
            y: 8
            width: 32
            height: 32
            color: isClick ? "#CC99FF" : "#7a55d8"
            radius: 16
            border.color: "#883333"
            scale: 1.1
            border.width: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Image {
                id: img_play
                x: 8
                y: 8
                width: 16
                height: 16
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: playing ? "Resource/img/pause.png" : "Resource/img/play.png"
                fillMode: Image.PreserveAspectFit
            }
            MouseArea {
                id: ms_play
                anchors.fill: parent
                onPressed: {
                    rec_play.isClick = !rec_play.isClick
                    if(playing == true){
                        console.log("Pause!")
                        playMusic.stop()
                        playing = !playing
                    }
                    else {
                        console.log("Playing!")
                        playMusic.play()
                        playing = !playing
                    }
                }
                onReleased: {
                    rec_play.isClick = !rec_play.isClick
                }
            }
        }

        Rectangle {
            id: rec_next
            property bool isClick: false
            signal clickNext()

            y: 8
            width: 24
            height: 24
            color: isClick ? "#CC99FF" : "#7a55d8"
            radius: 12
            border.color: "#967f7f"
            anchors.left: rec_play.right
            anchors.leftMargin: 15
            anchors.verticalCenter: parent.verticalCenter

            Image {
                id: img_next
                x: 8
                y: 8
                width: 12
                height: 12
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "Resource/img/next.png"
                fillMode: Image.PreserveAspectFit
            }
            MouseArea {
                id: ms_next
                anchors.fill: parent
                onPressed: {
                    rec_next.isClick = !rec_next.isClick
                    console.log("Next")
                    playbar.clickNext()
                    playing = false
                }
                onReleased: {
                    rec_next.isClick = !rec_next.isClick
                }
            }

        }

        Rectangle {
            id: rec_replay
            property bool isClick: false
            y: 8
            width: 24
            height: 24
            color: "#00000000"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            border.color: isClick ? "CC99FF" : "transparent"
            radius: 20

            Image {
                id: img_replay
                x: 8
                y: 0
                width: 16
                height: 16
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "Resource/img/replay.png"
                fillMode: Image.PreserveAspectFit
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    rec_replay.isClick = !rec_replay.isClick
                    console.log("Replay")
                }
            }
        }

        Rectangle {
            id: rec_shuffle
            property bool isClick: false
            x: 181
            y: 8
            width: 24
            height: 24
            color: "#00000000"
            radius: 20
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            border.color: isClick ? "CC99FF" : "transparent"

            Image {
                id: img_shuffle
                x: 8
                y: 8
                width: 16
                height: 16
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "Resource/img/shuffle.png"
                fillMode: Image.PreserveAspectFit
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    rec_shuffle.isClick = !rec_shuffle.isClick
                    console.log("Shuffle")
                }
            }
        }
    }
    // Player Bar (E)

    Connections{
        target: playbar
    }
    // Music Info (S)
    Rectangle {
        id: infoMusic
        property bool isShowMenu: false
        signal showMenu()
        signal closeMenu()
        x: 0
        width: parent.width
        height: 274
        radius: 1
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#a695cf"
            }

            GradientStop {
                position: 1
                color: "#d19deb"
            }
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                window.showingMenu = false
            }
        }

        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: scollBar.top
        anchors.bottomMargin: 1
        border.color: "#948686"


        Rectangle {
            id: rec_menu
            property bool isClick: false
            y: 8
            width: 32
            height: 32
            color: isClick ? "#CC99FF" : "#00000000"
            anchors.left: parent.left
            anchors.leftMargin: 10

            Image {
                id: img_menu
                x: 8
                y: 8
                width: 16
                height: 16
                z: 1
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "Resource/img/menu.png"
                fillMode: Image.PreserveAspectFit
            }
            MouseArea {
                id: ms_menu
                z: 1
                anchors.fill: parent
                onPressed: {
                    rec_menu.isClick = !rec_menu.isClick
                    infoMusic.showMenu()
                }
                onReleased: {
                    rec_menu.isClick = !rec_menu.isClick
                }
            }
        }

        Connections {
            target: playbar
            onClickNext: {
                var nCount = listView.count;
                if(listView.currentIndex < nCount - 1){
                    listView.currentIndex++;
                }
            }
            onClickPre: {
                if(listView.currentIndex > 0){
                    listView.currentIndex--;
                }
            }
        }

        ListView {
            id: listView
            x: 48
            y: 48
            width: 160
            height: 210
            rotation: 0
            transformOrigin: Item.Center
            highlightResizeDuration: 1
            flickableDirection: Flickable.HorizontalAndVerticalFlick
            highlightRangeMode: ListView.ApplyRange
            spacing: 6
            snapMode: ListView.SnapToItem
            highlightMoveDuration: 2
            anchors.horizontalCenter: parent.horizontalCenter
            orientation: ListView.Horizontal
            focus: true
//            model: ListModel {
//                ListElement {
//                    name: "oatmello - no way back"
//                    srcImg: "qrc:/Resource/img/example.png"
//                }

//                ListElement {
//                    name: "Wildflower"
//                    srcImg: "qrc:/Resource/img/sample4.jpg"
//                }
//                ListElement {
//                    name: "digitalluc - Float"
//                    srcImg: "qrc:/Resource/img/sample3.jpg"
//                }

//                ListElement {
//                    name: "blnkspc_ - Sticky"
//                    srcImg: "qrc:/Resource/img/sample2.jpg"
//                }
//                ListElement {
//                    name: "love the way you are"
//                    srcImg: "qrc:/Resource/img/sample5.jpg"
//                }
//                ListElement {
//                    name: "soft and skin"
//                    srcImg: "qrc:/Resource/img/sample7.jpg"
//                }
//                ListElement {
//                    name: "miss you like crazy"
//                    srcImg: "qrc:/Resource/img/sample9.jpg"
//                }
//                ListElement {
//                    name: "crazy song"
//                    srcImg: "qrc:/Resource/img/sample10.jpg"
//                }
//            }
            model: myModel
            delegate: Rectangle {
                width: 160
                height: 210
                color: "transparent"
                clip: true
                radius: 5
                Text{
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: name
                    font.italic: true
                }
                Rectangle{
                    id: img
                    width: 128
                    height: 128
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    clip: true
                    radius: 5
                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 125
                        height: 125
                        source: imgSrc
                    }

                }
            }
        }
    }
    Connections {
        target: infoMusic
        onShowMenu: {

            window.showingMenu = !window.showingMenu
            console.log("Show Menu: " + window.showingMenu)
        }
    }
    // Music Info (E)


    Loader {
        asynchronous: true
        active: true
        // Explicitly set the size of the
        // Loader to the parent item's size
        anchors.fill: parent
        sourceComponent: (window.showingMenu ) ? rect : undefined

    }

    Component {
      id: rect
      Menu {
          id: menuLoader
          widthMenu: window.width/2
          heightMenu: 273
          onCloseMenu: {
              window.showingMenu = false
          }
        }
    }

    // Scroll bar (S)
    Rectangle {
        id: scollBar
        x: 0
        width: parent.width
        height: 5
        color: "#779ae4"
        radius: 1
        anchors.bottom: playbar.top
        anchors.bottomMargin: 1
        border.color: "#948686"
    }
    // Sroll bar (E)
    Audio {
        id: playMusic
        source: "loosing_interest.mp3"
    }
}

























































































































































/*##^## Designer {
    D{i:8;anchors_height:434;anchors_y:0}D{i:6;anchors_height:8;anchors_width:8;anchors_x:8;anchors_y:8}
D{i:11;anchors_height:434;anchors_x:8;anchors_y:0}D{i:9;anchors_height:5;anchors_x:213;anchors_y:434}
D{i:17;anchors_height:5;anchors_y:434}D{i:15;anchors_height:434;anchors_y:0}D{i:19;anchors_height:5;anchors_y:434}
D{i:20;anchors_height:5;anchors_y:434}D{i:21;anchors_x:8}D{i:23;anchors_x:8}D{i:22;anchors_x:8}
}
 ##^##*/
