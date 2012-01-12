import QtQuick 1.1
import com.nokia.symbian 1.1

Item {
    id: item

    property bool centered: false
    property bool selectable: false
    property bool rtl: false

    height: 60
    width: parent.width

    signal clicked()

    Rectangle {
        anchors.fill: parent

        color: '#444'
        visible: mouseArea.pressed || (selectable && item.ListView.isCurrentItem)
    }

    Label {
        id: label

        anchors.verticalCenter: parent.verticalCenter
        // anchors.rightMargin: 20

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 20
        anchors.rightMargin: 20

        text: value
        color: 'white'

        state: item.centered ? "centered" : (item.rtl ? "rtl" : "")

        states: [
            State {
                name: "centered"
                AnchorChanges {
                    target: label
                    anchors.left: undefined
                    anchors.right: undefined
                    anchors.horizontalCenter: item.horizontalCenter
                }
            },

            State {
                name: "rtl"
                AnchorChanges {
                    target: label
                    anchors.right: item.right
                }
            }
        ]
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        onClicked: {
            item.clicked()
            if (item.selectable)
                item.ListView.view.currentIndex = index
        }
    }
}
