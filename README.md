# qml-form-builder
Create a form dynamically with QML

## Set a json with form properties and show the form in qml Page object



#### After the user submits the form, you will receive a json with the form data as field_name.value. Like this:
```
{
	"login": "enoque",
	"email": "joseneas@gmail.com",
	"password1": "123",
	"password2": "123",
	"country": "Japain",
	"terms_of_use": "Yes",
	"feeds": {
		"Cinema": true,
		"Entertainment": true,
		"Music": true
	}
}
```