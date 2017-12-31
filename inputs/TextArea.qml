import QtQuick 2.8
import QtQuick.Controls 2.0

TextArea {
    id: textAreaField
    width: parent.width
    selectByMouse: true
    onTextChanged: formBuilderPage.result[name] = text.trim()

    Component.onCompleted: formBuilderPage.result[name] = text.trim()

    property string name
    property alias initialValue: textAreaField.text
}
   
