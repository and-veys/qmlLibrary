import QtQuick 2.12

Item {
    height: parent.height
    width: parent.width
    property string sort_model: "genre"
    ListView {
        id: list
        anchors.fill: parent
        model: booksModel
        spacing: 1
        header: Rectangle {
            width: parent.width
            height: 20
            color: "darkblue"
            Text {
                anchors.centerIn: parent
                text: "Рубрикатор"
                color: "white"
            }
        }
        footer: Rectangle {
            width: parent.width
            height: 20
            color: "darkgreen"
            Text {
                anchors.centerIn: parent
                text: "Моя библиотека"
                color: "white"
            }
        }
        section.property: sort_model
        section.criteria: ViewSection.FullString
        section.delegate: Rectangle {
            width: parent.width
            height: 20
            color: "lightblue"
            Text {
                anchors.centerIn: parent
                text: section
                color: "darkblue"
                font.weight: Font.Bold

             }
        }
        delegate: Rectangle {
            width: parent.width
            height: 50
            radius: 3
            border.width: 1
            border.color: "darkgray"
            color: "lightgray"
            MouseArea {
                anchors.fill: parent
                onDoubleClicked: click_book(index)
            }
            Column {
                anchors.centerIn: parent
                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text { text: "Название:"; font.weight: Font.Bold}
                    Text { text: name }
                    spacing: 20
                }
                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text { text: "Автор:"; font.weight: Font.Bold}
                    Text { text: autor }
                    spacing: 20
                }
            }
            function click_book(ind) {
                console.log(list.model.get(ind).path);
            }
         }

         ListModel {
            id: booksModel
            ListElement {
                name: "Остров сокровищ"
                genre: "Приключение"
                autor: "Р. Стивенсон"
                path: "books/ostrov_sokrovishch.pdf"
            }
            ListElement {
                name: "Буратино"
                genre: "Детское"
                autor: "А. Толстой"
                path: "books/buratino.pdf"
            }
            ListElement {
                name: "Человек-амфибия"
                genre: "Фантастика"
                autor: "А. Беляев"
                path: "books/chelovek_amfibia.pdf"
            }
            ListElement {
                name: "День триффидов"
                genre: "Фантастика"
                autor: "Д. Уиндем"
                path: "books/den_triffidov.pdf"
            }
            ListElement {
                name: "Незнайка на луне"
                genre: "Детское"
                autor: "Н. Носов"
                path: "books/neznaika_na_lune.pdf"
            }
            ListElement {
                name: "Пикник на обочине"
                genre: "Фантастика"
                autor: "А. и Б. Стругацкие"
                path: "books/picknik_na_obochine.pdf"
            }
            function sortModel(ind) {
                for(var i=0; i<count; ++i) {
                    for(var j=0; j<i; ++j) {
                        if(get(i).genre === get(j).genre) {
                            move(i, j, 1);
                            break;
                        }
                    }
                }
            }
            Component.onCompleted: sortModel(sort_model)
        }
        Component.onCompleted: positionViewAtBeginning()
     }
}

