import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ColumnLayout {
    spacing: 10
    width: parent.width
    Text {
        text: "Стартовая страница"
        Layout.alignment: Qt.AlignHCenter
    }
    Button {
        text: "Регистрация"
        Layout.alignment: Qt.AlignHCenter
        onClicked: click_button()
    }
    function click_button() {
        parent.state = "second"
    }
}
