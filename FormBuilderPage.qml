import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Page {
    id: formBuilderPage

    Label {
        visible: !form
        anchors.centerIn: parent
        text: qsTr("Set the form properties!")
    }

    // set in this property the object with the form properties
    property var form
    onFormChanged: {
        if (!form || !Object.keys(form).length || !form.fields.length || listViewModel.count)
            return
        for (var i = 0; i < form.fields.length; ++i)
            listViewModel.append(form.fields[i])
    }

    // keeps the result to the form as object: field_name.value
    property var result: ({})

    signal cancel()
    signal submit(var form)
    onSubmit: console.log("form submit: ", JSON.stringify(form))

    Item {
        anchors.fill: parent

        Text {
            id: formTitle
            text: form ? form.title : ""
            visible: text.length > 0
            anchors { top: parent.top; topMargin: 15; horizontalCenter: parent.horizontalCenter }
        }

        Text {
            id: formDescription
            text: form ? form.description : ""
            visible: text.length > 0
            anchors { top: formTitle.bottom; topMargin: 15; horizontalCenter: parent.horizontalCenter }
        }

        ListView {
            width: parent.width
            spacing: 20; clip: true
            bottomMargin: 75
            delegate: FieldTemplate { }
            model: ListModel { id: listViewModel }
            anchors {
                bottom: buttons.top; bottomMargin: 2
                top: formDescription.bottom; topMargin: 15
                horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            id: buttons
            color: "#fcfcfc"
            width: parent.width; height: 45
            anchors.bottom: parent.bottom

            Button {
                flat: true
                width: parent.width/2; height: parent.height
                text: qsTr("Cancel")
                onClicked: cancel()
                anchors {
                    left: parent.left
                    leftMargin: 0
                    verticalCenter: parent.verticalCenter
                }
            }

            Rectangle {
                width: 1; height: parent.height
                color: "#aaa"
                anchors.centerIn: parent
            }

            Button {
                flat: true
                width: parent.width / 2; height: parent.height
                text: qsTr("Submit")
                onClicked: submit(formBuilderPage.result)
                anchors {
                    right: parent.right
                    rightMargin: 0
                    verticalCenter: parent.verticalCenter
                }
            }
        }
    }
}
