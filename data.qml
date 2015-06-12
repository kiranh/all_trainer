import QtQuick 2.4

ListModel {
    id: questionData
    ListElement {
        type: "intro"
        sound: "sounds/intro.wav"
        header: "Which?"
    }
    ListElement {
        type: "mcq"
        header: "Which one is fruit?"
        sound: "sounds/fruit.wav"
        questions: [
            ListElement {src: "pics/apple.png"; sound: "sounds/apple.wav"; correct: true},
            ListElement {
                src: "pics/chopper.png"; sound: "sounds/chopper.wav"; correct: true
            }
        ]
    }
}
