# qml-form-builder
Create a form dynamically with QML

Set a json with some properties and create a form to show as QML Page
The follow json create a form using a title, a description and a set of fields

```
{
    "title" : "Form title",
    "description" : "Form description...",
    "fields" : [
        {
            "name": "login",
            "label": "Login",
            "description" : "Enter your login",
            "fieldType": "TextField",
            "placeholderText": "Enter your login",
            "initialValue": ""
        },
        {
            "name": "email",
            "label": "Email",
            "description" : "The Email is required to continue your register.",
            "fieldType": "TextField",
            "placeholderText": "Enter your Email",
            "initialValue": ""
        },
        {
            "name": "password1",
            "label": "Password",
            "description" : "The Password is required to continue your register.",
            "fieldType": "Password",
            "placeholderText": "Enter your Password",
            "initialValue": ""
        },
        {
            "name": "password2",
            "label": "Repeat the password",
            "description" : "The Password is required to continue your register.",
            "fieldType": "Password",
            "placeholderText": "Repeat the Password",
            "initialValue": ""
        },
        {
            "name": "country",
            "label": "Select your country",
            "description" : "Choose your country from the options list.",
            "fieldType": "ComboBox",
            "initialValue": "jp",
            "options": {
                "ar": "Argentina",
                "br": "Brazil",
                "us": "EUA",
                "es": "Espain",
                "jp": "Japan",
                "ch": "China"
            }
        },
        {
            "name": "terms_of_use",
            "label": "Accept the terms of use",
            "description" : "",
            "fieldType": "Radio",
            "options": {
               "values" : [
                    {
                        "label": "Yes",
                        "checked": true
                    },
                    {
                        "label": "No",
                        "checked": false
                    }
                ]
            }
        },
        {
            "name": "feeds",
            "label": "Feeds categories",
            "description" : "Select the initial feeds categories you like to sign",
            "fieldType": "Checkbox",
            "options": {
               "values" : [
                    {
                        "label": "Cinema",
                        "checked": true
                    },
                    {
                        "label": "Entertainment",
                        "checked": false
                    },
                    {
                        "label": "Music",
                        "checked": false
                    },
                    {
                        "label": "Sports",
                        "checked": false
                    },
                    {
                        "label": "Policy",
                        "checked": false
                    }
                ]
            }
        }
    ]
}
```

The code above, generate this form:



The fields available is: Checkbox, ComboBox, TextField, TextArea and RadioButton.
When user submit the form, you will receive a json with the form data as fieldname.value. Like this:

```
{
    "login": "joseneas",
    "email": "joseneas@test.com",
    "password1": "123",
    "password2": "123",
    "country": "Japan",
    "terms_of_use": "Yes",
    "feeds": {
        "Cinema": true,
        "Entertainment": true,
        "Music": true,
        "Sports": true,
        "Policy": true
    }
}
```