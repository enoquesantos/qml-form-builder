import QtQuick 2.8
import QtQuick.Controls 2.2

ApplicationWindow {
    visible: true; x: 450; y: 50
    width: 380; height: 580
    title: qsTr("Hello World!")

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
