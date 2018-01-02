import QtQuick 2.8
import QtQuick.Controls 2.2
import QtQuick.Window 2.2

ApplicationWindow {
    visible: tru
    width: Qt.platform.os === "linux" || Qt.platform.os === "osx" ? (Screen.width / 2.5) : Screen.width
    height: Qt.platform.os === "linux" || Qt.platform.os === "osx" ? (Screen.height * 0.90) : Screen.height
    title: qsTr("Hello World!")

    Component.onCompleted: {
        // when runnig in desktop mode, centralize the application window.
        if (["linux","osx"].indexOf(Qt.platform.os) > -1) {
            setX(Screen.width / 2 - width / 2)
            setY(Screen.height / 2 - height / 2)
        }
    }

    property var formContent: ReadJson.readFile(":/sample-form-data-1.json")

    FormBuilderPage {
        id: page
        form: formContent
    }

    StackView {
        id: pageStack
        initialItem: page
        anchors.fill: parent
    }
}
