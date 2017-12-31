import QtQuick 2.8
import QtQuick.Controls 2.0

TextField {
    id: textField
    width: parent.width
    selectByMouse: true
    inputMethodHints: name.indexOf("email") ? Qt.ImhEmailCharactersOnly|Qt.ImhLowercaseOnly : Qt.ImhNone
    onTextChanged: formBuilderPage.result[name] = text.trim()

    Component.onCompleted: formBuilderPage.result[name] = text.trim()

    property string name
    property alias initialValue: textField.text
}
