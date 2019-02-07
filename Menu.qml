import QtQuick 2.0

Item {
    id: item
    property alias widthMenu: menu.width
    property alias heightMenu: menu.height
    signal closeMenu()
    property bool isCloseMenu: false
    x: -7
    z: 1

    Rectangle{
        id: menu
        color: "#CC99FF"
        opacity: 1
        visible: true
        radius: 7
        border.color: "white"
        Rectangle{
            anchors.fill: parent
            color: "transparent"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    item.closeMenu()
                    item.isCloseMenu = true
                    console.log("Close Menu")
                }
            }
        }
        Image {
            id: back
            source: "qrc:/Resource/img/back.png"
            anchors.bottom: playlist.top
            anchors.bottomMargin: 17
            anchors.left: playlist.left
            anchors.leftMargin: 25
        }
        Rectangle {
            property bool isClick: false
            id: playlist
            width: parent.width
            height: parent.height/8
            anchors.top: parent.top
            anchors.topMargin: 50
            border.color: "white"
            radius: 7
            color: isClick ? "white" : "transparent"
            Image {
                id: playListImg
                source: "qrc:/Resource/img/playlist.png"// This is available in all editors.
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 20
            }
            Text{
                anchors.left: playListImg.right
                anchors.leftMargin: 10
                anchors.verticalCenter: playListImg.verticalCenter
                text: "Playlists"
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    playlist.isClick = !playlist.isClick
                }
                onReleased: {
                    playlist.isClick = !playlist.isClick
                }
            }
        }
        Rectangle {
            property bool isClick: false
            id: artist
            width: parent.width
            height: parent.height/8
            anchors.top: playlist.bottom
            border.color: "white"
            radius: 7
            color: isClick ? "white" : "transparent"
            Image {
                id: artistImg
                source: "qrc:/Resource/img/artist.png"// This is available in all editors.
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 20
            }
            Text{
                anchors.left: artistImg.right
                anchors.leftMargin: 10
                anchors.verticalCenter: artistImg.verticalCenter
                text: "Artists"
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    artist.isClick = !artist.isClick
                }
                onReleased: {
                    artist.isClick = !artist.isClick
                }
            }
        }
        Rectangle {
            property bool isClick: false
            id: album
            width: parent.width
            height: parent.height/8
            anchors.top: artist.bottom
            border.color: "white"
            radius: 7
            color: isClick ? "white" : "transparent"
            Image {
                id: albumImg
                source: "qrc:/Resource/img/album.png"// This is available in all editors.
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 20
            }
            Text{
                anchors.left: albumImg.right
                anchors.leftMargin: 10
                anchors.verticalCenter: albumImg.verticalCenter
                text: "Albums"
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    album.isClick = !album.isClick
                }
                onReleased: {
                    album.isClick = !album.isClick
                }
            }
        }
        Rectangle {
            property bool isClick: false
            id: song
            width: parent.width
            height: parent.height/8
            anchors.top: album.bottom
            border.color: "white"
            radius: 7
            color: isClick ? "white" : "transparent"
            Image {
                id: songImg
                source: "qrc:/Resource/img/music-player.png"// This is available in all editors.
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 20
            }
            Text{
                anchors.left: songImg.right
                anchors.leftMargin: 10
                anchors.verticalCenter: songImg.verticalCenter
                text: "Songs"
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    song.isClick = !song.isClick
                }
                onReleased: {
                    song.isClick = !song.isClick
                }
            }
        }
        Rectangle {
            property bool isClick: false
            id: genres
            width: parent.width
            height: parent.height/8
            anchors.top: song.bottom
            border.color: "white"
            radius: 7
            color: isClick ? "white" : "transparent"
            Image {
                id: genreImg
                source: "qrc:/Resource/img/dj.png"// This is available in all editors.
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 20
            }
            Text{
                anchors.left: genreImg.right
                anchors.leftMargin: 10
                anchors.verticalCenter: genreImg.verticalCenter
                text: "Genres"
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    genres.isClick = !genres.isClick
                }
                onReleased: {
                    genres.isClick = !genres.isClick
                }
            }
        }
    }

}
