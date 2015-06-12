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
            ListElement {
                src: "pics/apple.png"; sound: "sounds/apple.wav"; correct: true
            },
            ListElement {
                src: "pics/chopper.jpg"; sound: "sounds/chopper.wav"; correct: false
            },
            ListElement {
                src: "pics/car.png"; sound: "sounds/car.wav"; correct: false
            },
            ListElement {
                src: "pics/pant.jpg"; sound: "sounds/pant.wav"; correct: false
            }
        ]
    }
}
