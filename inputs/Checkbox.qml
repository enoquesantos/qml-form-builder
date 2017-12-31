import QtQuick 2.8
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Rectangle {
    clip: true; color: "transparent"
    width: parent.width; height: column.implicitHeight

    property string name
    property var optionsSelected: ({})
    onOptionsSelectedChanged: formBuilderPage.result[name] = optionsSelected

    ColumnLayout {
        id: column
        spacing: 5

        Repeater {
            id: checkboxRepeater
            model: options.values // options is a delegate property set dinamically

            CheckBox {
                checked: modelData.checked
                text: modelData.label
                onCheckedChanged: {
                    if (optionsSelected && optionsSelected[modelData.label] === checked)
                        return
                    optionsSelected[modelData.label] = checked
                    optionsSelected = optionsSelected
                }
                Component.onCompleted: {
                    optionsSelected[modelData.label] === checked
                    optionsSelected = optionsSelected
                }
            }
        }
    }
}
