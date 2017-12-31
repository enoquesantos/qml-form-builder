import QtQuick 2.0
import QtQuick.Controls 2.2

Component {
    id: fieldTemplate

    Column {
        id: column
        width: parent.width * 0.90
        spacing: 2
        anchors.horizontalCenter: parent.horizontalCenter

        Label {
            id: labelTitle
            text: label
            elide: Label.ElideRight; wrapMode: Label.WrapAnywhere
            width: parent.width; height: 20
            visible: text.length > 0

            MouseArea {
                anchors.fill: parent
                onClicked: tooltipDescription.open()
            }
        }

        Item {
            id: itemField
            width: parent.width; height: 40
            anchors.horizontalCenter: parent.horizontalCenter

            ToolTip {
                id: tooltipDescription
                text: description
                timeout: 2000
            }

            Component.onCompleted: {
                var comp = Qt.createComponent(Qt.resolvedUrl("inputs/%1.qml".arg(fieldType)))
                if (comp.status === Component.Ready) {
                    comp = comp.createObject(itemField, {
                        "name": name,
                        "initialValue": typeof initialValue !== "undefined" ? initialValue : null,
                        "placeholderText": typeof placeholderText !== "undefined" ? placeholderText : null,
                        "options": typeof options !== "undefined" ? options : null
                    })
                    itemField.height = comp.height
                } else if (comp.status === Component.Error) {
                    console.error("error string: ", comp.errorString())
                }
            }
        }
    }
}
