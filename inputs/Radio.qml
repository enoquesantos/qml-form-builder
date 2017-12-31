import QtQuick 2.8
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Rectangle {
    clip: true; color: "transparent"
    width: parent.width; height: column.implicitHeight

    property string name
    property var initialValue

    ColumnLayout {
        id: column
        spacing: 5

        Component.onCompleted: formBuilderPage.result[name] = radioOptionGroup.checkedButton.text

        ButtonGroup {
            id: radioOptionGroup
            onCheckedButtonChanged: formBuilderPage.result[name] = checkedButton.text
        }

        Repeater {
            id: radioRepeater
            model: options.values // options is a delegate property set dinamically

            RadioButton {
                clip: true
                checked: modelData.checked
                text: modelData.label
                ButtonGroup.group: radioOptionGroup
            }
        }
    }
}
