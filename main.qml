import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 600
    height: 300
    title: qsTr("Моя библиотека")
    Rectangle {
        id: rect
        anchors.fill: parent
        color: "lightgreen"
        state: "first"
        Startpage {
            id: start_page
            width:  parent.width/2
            x: (parent.width-width)/2
            anchors.verticalCenter: parent.verticalCenter
        }
        Registration {
            id: registration
            width:  parent.width/2
            x: -width
            anchors.verticalCenter: parent.verticalCenter
        }
        BusyIndicator {
            id: load_data
            anchors.centerIn: parent
            running: false
        }
        Library {
            id: library
            width:  parent.width
            x: parent.width

        }

        states: [           
            State {
                name: "second"
                PropertyChanges {
                    target: start_page
                    x:  -width
                    restoreEntryValues: false
                }
                PropertyChanges {
                    target: registration
                    x: (parent.width-width)/2
                    restoreEntryValues: false
                }
                PropertyChanges {
                    target: rect
                    color:  "lightblue"
                    restoreEntryValues: false
                }
            },
            State {
                name: "third"
                PropertyChanges {
                    target: registration
                    x: -width
                    restoreEntryValues: false
                }
                PropertyChanges {
                    target: rect
                    color:  "yellow"
                    restoreEntryValues: false
                }
                PropertyChanges {
                    target: load_data
                    running:  true
                    restoreEntryValues: false
                }
            },
            State {
                name: "fourth"
                PropertyChanges {
                    target: rect
                    color:  "white "
                    restoreEntryValues: false
                }
                PropertyChanges {
                    target: load_data
                    running:  false
                    restoreEntryValues: false
                }
                PropertyChanges {
                    target: library
                    x: 0
                    restoreEntryValues: false
                }

            }

        ]
        transitions: [
            Transition {
                from: "first"
                to: "second"

                ParallelAnimation {
                    PropertyAnimation{ property: "x"; duration: 1000 }
                    PropertyAnimation{ property: "color"; duration: 1000 }
                }
            },
            Transition {
                from: "second"
                to: "third"
                ParallelAnimation {
                    PropertyAnimation{ property: "x"; duration: 1000 }
                    PropertyAnimation{ property: "color"; duration: 1000 }
                    PropertyAnimation{ property: "running"; duration: 400 }
                }
            },
            Transition {
                from: "third"
                to: "fourth"
                ParallelAnimation {
                    PropertyAnimation{ property: "x"; duration: 1000 }
                    PropertyAnimation{ property: "color"; duration: 1000 }
                    PropertyAnimation{ property: "running"; duration: 400 }
                }
            }
        ]
    }
}
