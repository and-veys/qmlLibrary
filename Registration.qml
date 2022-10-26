import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ColumnLayout {
    property string login:  "login"
    property string password: "password"
    id: reg
    spacing: 10
    width: parent.width
    Text {
        text: "Введите логин и пароль"
        Layout.alignment: Qt.AlignHCenter
    }
    TextField {
        id: text_login
        Layout.alignment: Qt.AlignHCenter
        placeholderText: "логин"

    }
    TextField {
        id: text_password
        Layout.alignment: Qt.AlignHCenter
        echoMode: TextInput.Password
        placeholderText: "пароль"
    }

    Button {
        text: "Войти"
        Layout.alignment: Qt.AlignHCenter
        onClicked: click_button()
    }
    SequentialAnimation {
        id: anim
        PropertyAnimation {
            target: reg
            properties: "x"
            from: reg.x
            to: reg.x - 10
            duration: 50
        }
        PropertyAnimation {
            target: reg
            properties: "x"
            from: reg.x
            to: reg.x + 10
            duration: 100
        }
        PropertyAnimation {
            target: reg
            properties: "x"
            from: reg.x + 10
            to: reg.x
            duration: 50
        }
    }
    Timer {
        id: timer
        interval: 4000
        onTriggered: end_load()
    }
    function click_button() {
        if(text_login.text === login && text_password.text === password) {
            parent.state = "third";
            timer.start()
        }
        else
            anim.start()
    }
    function end_load() {
        parent.state = "fourth";
    }
}
