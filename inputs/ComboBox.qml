import QtQuick 2.8
import QtQuick.Controls 2.0

ComboBox {
    model: ListModel { id: listModel }
    width: parent.width; height: 45
    currentIndex: initialValue ? find(initialValue) : 0

    onActivated: formBuilderPage.result[name] = textAt(currentIndex)

    Component.onCompleted: formBuilderPage.result[name] = textAt(currentIndex)

    property string name
    property var initialValue
    property var options: {}
    onOptionsChanged: {
        var i = 0
        for (var prop in options) {
            listModel.append({prop: options[prop]})
            if (initialValue && initialValue === prop)
                currentIndex = i
            ++i
        }
    }
}

