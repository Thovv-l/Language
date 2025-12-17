import Foundation

class LessonContent {

    // MARK: - Translation Dictionaries

    // Key: English phrase, Value: Translations [pt-BR, es, fr, nl]
    static let translations: [String: [String: String]] = [
        // Greetings
        "Hello": [
            "pt-BR": "Olá",
            "es": "Hola",
            "fr": "Bonjour",
            "nl": "Hallo"
        ],
        "Good morning": [
            "pt-BR": "Bom dia",
            "es": "Buenos días",
            "fr": "Bonjour",
            "nl": "Goedemorgen"
        ],
        "Good afternoon": [
            "pt-BR": "Boa tarde",
            "es": "Buenas tardes",
            "fr": "Bon après-midi",
            "nl": "Goedemiddag"
        ],
        "Good evening": [
            "pt-BR": "Boa noite",
            "es": "Buenas noches",
            "fr": "Bonsoir",
            "nl": "Goedenavond"
        ],
        "How are you?": [
            "pt-BR": "Como você está?",
            "es": "¿Cómo estás?",
            "fr": "Comment allez-vous?",
            "nl": "Hoe gaat het?"
        ],
        "I'm fine, thank you": [
            "pt-BR": "Estou bem, obrigado",
            "es": "Estoy bien, gracias",
            "fr": "Je vais bien, merci",
            "nl": "Het gaat goed, dank je"
        ],
        "What's your name?": [
            "pt-BR": "Qual é o seu nome?",
            "es": "¿Cómo te llamas?",
            "fr": "Comment vous appelez-vous?",
            "nl": "Hoe heet je?"
        ],
        "My name is...": [
            "pt-BR": "Meu nome é...",
            "es": "Me llamo...",
            "fr": "Je m'appelle...",
            "nl": "Ik heet..."
        ],
        "Nice to meet you": [
            "pt-BR": "Prazer em conhecê-lo",
            "es": "Encantado de conocerte",
            "fr": "Enchanté",
            "nl": "Aangenaam"
        ],
        "Goodbye": [
            "pt-BR": "Tchau",
            "es": "Adiós",
            "fr": "Au revoir",
            "nl": "Tot ziens"
        ],

        // Food & Dining
        "I would like a coffee": [
            "pt-BR": "Eu gostaria de um café",
            "es": "Quisiera un café",
            "fr": "Je voudrais un café",
            "nl": "Ik wil graag een koffie"
        ],
        "Can I see the menu?": [
            "pt-BR": "Posso ver o cardápio?",
            "es": "¿Puedo ver el menú?",
            "fr": "Puis-je voir le menu?",
            "nl": "Mag ik de menukaart zien?"
        ],
        "The check, please": [
            "pt-BR": "A conta, por favor",
            "es": "La cuenta, por favor",
            "fr": "L'addition, s'il vous plaît",
            "nl": "De rekening, alstublieft"
        ],
        "This is delicious": [
            "pt-BR": "Isto está delicioso",
            "es": "Esto está delicioso",
            "fr": "C'est délicieux",
            "nl": "Dit is heerlijk"
        ],
        "I'm vegetarian": [
            "pt-BR": "Sou vegetariano",
            "es": "Soy vegetariano",
            "fr": "Je suis végétarien",
            "nl": "Ik ben vegetariër"
        ],
        "Water, please": [
            "pt-BR": "Água, por favor",
            "es": "Agua, por favor",
            "fr": "De l'eau, s'il vous plaît",
            "nl": "Water, alstublieft"
        ],
        "Do you have wifi?": [
            "pt-BR": "Você tem wifi?",
            "es": "¿Tienen wifi?",
            "fr": "Avez-vous le wifi?",
            "nl": "Heeft u wifi?"
        ],

        // Travel
        "Where is the bathroom?": [
            "pt-BR": "Onde fica o banheiro?",
            "es": "¿Dónde está el baño?",
            "fr": "Où sont les toilettes?",
            "nl": "Waar is het toilet?"
        ],
        "How much does it cost?": [
            "pt-BR": "Quanto custa?",
            "es": "¿Cuánto cuesta?",
            "fr": "Combien ça coûte?",
            "nl": "Hoeveel kost het?"
        ],
        "I need help": [
            "pt-BR": "Preciso de ajuda",
            "es": "Necesito ayuda",
            "fr": "J'ai besoin d'aide",
            "nl": "Ik heb hulp nodig"
        ],
        "Do you speak English?": [
            "pt-BR": "Você fala inglês?",
            "es": "¿Hablas inglés?",
            "fr": "Parlez-vous anglais?",
            "nl": "Spreek je Engels?"
        ],
        "I don't understand": [
            "pt-BR": "Eu não entendo",
            "es": "No entiendo",
            "fr": "Je ne comprends pas",
            "nl": "Ik begrijp het niet"
        ],
        "Can you help me?": [
            "pt-BR": "Você pode me ajudar?",
            "es": "¿Puedes ayudarme?",
            "fr": "Pouvez-vous m'aider?",
            "nl": "Kun je me helpen?"
        ],
        "Where is the train station?": [
            "pt-BR": "Onde fica a estação de trem?",
            "es": "¿Dónde está la estación de tren?",
            "fr": "Où est la gare?",
            "nl": "Waar is het treinstation?"
        ],
        "One ticket to..., please": [
            "pt-BR": "Um bilhete para..., por favor",
            "es": "Un billete a..., por favor",
            "fr": "Un billet pour..., s'il vous plaît",
            "nl": "Een kaartje naar..., alstublieft"
        ],

        // Shopping
        "How much is this?": [
            "pt-BR": "Quanto custa isto?",
            "es": "¿Cuánto cuesta esto?",
            "fr": "Combien coûte ceci?",
            "nl": "Hoeveel kost dit?"
        ],
        "I'm just looking": [
            "pt-BR": "Estou apenas olhando",
            "es": "Solo estoy mirando",
            "fr": "Je regarde seulement",
            "nl": "Ik kijk alleen maar"
        ],
        "Can I try this on?": [
            "pt-BR": "Posso experimentar isto?",
            "es": "¿Puedo probarme esto?",
            "fr": "Puis-je essayer ceci?",
            "nl": "Mag ik dit passen?"
        ],
        "Do you accept credit cards?": [
            "pt-BR": "Vocês aceitam cartão de crédito?",
            "es": "¿Aceptan tarjetas de crédito?",
            "fr": "Acceptez-vous les cartes de crédit?",
            "nl": "Accepteert u creditcards?"
        ],
        "I'll take it": [
            "pt-BR": "Vou levar",
            "es": "Me lo llevo",
            "fr": "Je le prends",
            "nl": "Ik neem het"
        ],

        // Directions
        "Excuse me": [
            "pt-BR": "Com licença",
            "es": "Disculpe",
            "fr": "Excusez-moi",
            "nl": "Pardon"
        ],
        "I'm lost": [
            "pt-BR": "Estou perdido",
            "es": "Estoy perdido",
            "fr": "Je suis perdu",
            "nl": "Ik ben verdwaald"
        ],
        "Turn right": [
            "pt-BR": "Vire à direita",
            "es": "Gire a la derecha",
            "fr": "Tournez à droite",
            "nl": "Ga rechtsaf"
        ],
        "Turn left": [
            "pt-BR": "Vire à esquerda",
            "es": "Gire a la izquierda",
            "fr": "Tournez à gauche",
            "nl": "Ga linksaf"
        ],
        "Go straight": [
            "pt-BR": "Vá em frente",
            "es": "Siga recto",
            "fr": "Allez tout droit",
            "nl": "Ga rechtdoor"
        ],

        // Accommodation
        "I have a reservation": [
            "pt-BR": "Eu tenho uma reserva",
            "es": "Tengo una reserva",
            "fr": "J'ai une réservation",
            "nl": "Ik heb een reservering"
        ],
        "Can I see the room?": [
            "pt-BR": "Posso ver o quarto?",
            "es": "¿Puedo ver la habitación?",
            "fr": "Puis-je voir la chambre?",
            "nl": "Mag ik de kamer zien?"
        ],
        "What time is check-out?": [
            "pt-BR": "Que horas é o check-out?",
            "es": "¿A qué hora es el check-out?",
            "fr": "À quelle heure est le départ?",
            "nl": "Hoe laat is uitchecken?"
        ],
        "Do you have a room available?": [
            "pt-BR": "Você tem um quarto disponível?",
            "es": "¿Tienen una habitación disponible?",
            "fr": "Avez-vous une chambre disponible?",
            "nl": "Heeft u een kamer beschikbaar?"
        ],

        // Emergencies
        "Call the police": [
            "pt-BR": "Chame a polícia",
            "es": "Llame a la policía",
            "fr": "Appelez la police",
            "nl": "Bel de politie"
        ],
        "I need a doctor": [
            "pt-BR": "Preciso de um médico",
            "es": "Necesito un doctor",
            "fr": "J'ai besoin d'un médecin",
            "nl": "Ik heb een dokter nodig"
        ],
        "Where is the hospital?": [
            "pt-BR": "Onde fica o hospital?",
            "es": "¿Dónde está el hospital?",
            "fr": "Où est l'hôpital?",
            "nl": "Waar is het ziekenhuis?"
        ],
        "Help!": [
            "pt-BR": "Socorro!",
            "es": "¡Ayuda!",
            "fr": "Au secours!",
            "nl": "Help!"
        ],

        // Basic phrases
        "Yes": [
            "pt-BR": "Sim",
            "es": "Sí",
            "fr": "Oui",
            "nl": "Ja"
        ],
        "No": [
            "pt-BR": "Não",
            "es": "No",
            "fr": "Non",
            "nl": "Nee"
        ],
        "Please": [
            "pt-BR": "Por favor",
            "es": "Por favor",
            "fr": "S'il vous plaît",
            "nl": "Alstublieft"
        ],
        "Thank you": [
            "pt-BR": "Obrigado",
            "es": "Gracias",
            "fr": "Merci",
            "nl": "Dank je"
        ],
        "You're welcome": [
            "pt-BR": "De nada",
            "es": "De nada",
            "fr": "De rien",
            "nl": "Graag gedaan"
        ],
        "I'm sorry": [
            "pt-BR": "Desculpe",
            "es": "Lo siento",
            "fr": "Je suis désolé",
            "nl": "Het spijt me"
        ],

        // Numbers
        "One": [
            "pt-BR": "Um",
            "es": "Uno",
            "fr": "Un",
            "nl": "Een"
        ],
        "Two": [
            "pt-BR": "Dois",
            "es": "Dos",
            "fr": "Deux",
            "nl": "Twee"
        ],
        "Three": [
            "pt-BR": "Três",
            "es": "Tres",
            "fr": "Trois",
            "nl": "Drie"
        ],
        "Four": [
            "pt-BR": "Quatro",
            "es": "Cuatro",
            "fr": "Quatre",
            "nl": "Vier"
        ],
        "Five": [
            "pt-BR": "Cinco",
            "es": "Cinco",
            "fr": "Cinq",
            "nl": "Vijf"
        ],

        // Time
        "What time is it?": [
            "pt-BR": "Que horas são?",
            "es": "¿Qué hora es?",
            "fr": "Quelle heure est-il?",
            "nl": "Hoe laat is het?"
        ],
        "Today": [
            "pt-BR": "Hoje",
            "es": "Hoy",
            "fr": "Aujourd'hui",
            "nl": "Vandaag"
        ],
        "Tomorrow": [
            "pt-BR": "Amanhã",
            "es": "Mañana",
            "fr": "Demain",
            "nl": "Morgen"
        ],
        "Yesterday": [
            "pt-BR": "Ontem",
            "es": "Ayer",
            "fr": "Hier",
            "nl": "Gisteren"
        ]
    ]

    // MARK: - Lesson Generation

    static func getLessons(for languagePair: LanguagePair) -> [Lesson] {
        var lessons: [Lesson] = []

        // Basics Lessons
        lessons.append(createBasicsLesson1(for: languagePair))
        lessons.append(createBasicsLesson2(for: languagePair))

        // Greetings Lessons
        lessons.append(createGreetingsLesson1(for: languagePair))
        lessons.append(createGreetingsLesson2(for: languagePair))

        // Food & Dining
        lessons.append(createFoodLesson1(for: languagePair))
        lessons.append(createFoodLesson2(for: languagePair))

        // Travel
        lessons.append(createTravelLesson1(for: languagePair))
        lessons.append(createTravelLesson2(for: languagePair))

        // Shopping
        lessons.append(createShoppingLesson(for: languagePair))

        // Directions
        lessons.append(createDirectionsLesson(for: languagePair))

        // Emergencies
        lessons.append(createEmergenciesLesson(for: languagePair))

        return lessons
    }

    // MARK: - Individual Lesson Creators

    static func createBasicsLesson1(for languagePair: LanguagePair) -> Lesson {
        let exercises = createExercises(
            phrases: ["Yes", "No", "Please", "Thank you", "You're welcome"],
            languagePair: languagePair
        )

        return Lesson(
            title: "Essential Words",
            category: .basics,
            level: .beginner,
            description: "Learn the most essential words you'll use every day",
            exercises: exercises,
            xpReward: 10,
            estimatedMinutes: 3
        )
    }

    static func createBasicsLesson2(for languagePair: LanguagePair) -> Lesson {
        let exercises = createExercises(
            phrases: ["I'm sorry", "Excuse me", "I don't understand", "Do you speak English?"],
            languagePair: languagePair
        )

        return Lesson(
            title: "Getting Help",
            category: .basics,
            level: .beginner,
            description: "Essential phrases for when you need assistance",
            exercises: exercises,
            xpReward: 10,
            estimatedMinutes: 4
        )
    }

    static func createGreetingsLesson1(for languagePair: LanguagePair) -> Lesson {
        let exercises = createExercises(
            phrases: ["Hello", "Good morning", "Good afternoon", "Good evening", "Goodbye"],
            languagePair: languagePair
        )

        return Lesson(
            title: "Basic Greetings",
            category: .greetings,
            level: .beginner,
            description: "Learn how to greet people throughout the day",
            exercises: exercises,
            xpReward: 10,
            estimatedMinutes: 4
        )
    }

    static func createGreetingsLesson2(for languagePair: LanguagePair) -> Lesson {
        let exercises = createExercises(
            phrases: ["How are you?", "I'm fine, thank you", "What's your name?", "My name is...", "Nice to meet you"],
            languagePair: languagePair
        )

        return Lesson(
            title: "Introductions",
            category: .greetings,
            level: .beginner,
            description: "Introduce yourself and make new friends",
            exercises: exercises,
            xpReward: 15,
            estimatedMinutes: 5
        )
    }

    static func createFoodLesson1(for languagePair: LanguagePair) -> Lesson {
        let exercises = createExercises(
            phrases: ["I would like a coffee", "Water, please", "Can I see the menu?", "The check, please"],
            languagePair: languagePair
        )

        return Lesson(
            title: "At the Restaurant",
            category: .food,
            level: .beginner,
            description: "Order food and drinks like a local",
            exercises: exercises,
            xpReward: 15,
            estimatedMinutes: 5
        )
    }

    static func createFoodLesson2(for languagePair: LanguagePair) -> Lesson {
        let exercises = createExercises(
            phrases: ["This is delicious", "I'm vegetarian", "Do you have wifi?"],
            languagePair: languagePair
        )

        return Lesson(
            title: "Dining Preferences",
            category: .food,
            level: .intermediate,
            description: "Express your dietary needs and preferences",
            exercises: exercises,
            xpReward: 15,
            estimatedMinutes: 4
        )
    }

    static func createTravelLesson1(for languagePair: LanguagePair) -> Lesson {
        let exercises = createExercises(
            phrases: ["Where is the bathroom?", "How much does it cost?", "I need help", "Can you help me?"],
            languagePair: languagePair
        )

        return Lesson(
            title: "Travel Essentials",
            category: .travel,
            level: .beginner,
            description: "Navigate your travels with confidence",
            exercises: exercises,
            xpReward: 15,
            estimatedMinutes: 5
        )
    }

    static func createTravelLesson2(for languagePair: LanguagePair) -> Lesson {
        let exercises = createExercises(
            phrases: ["Where is the train station?", "One ticket to..., please"],
            languagePair: languagePair
        )

        return Lesson(
            title: "Transportation",
            category: .travel,
            level: .intermediate,
            description: "Get around using public transportation",
            exercises: exercises,
            xpReward: 15,
            estimatedMinutes: 4
        )
    }

    static func createShoppingLesson(for languagePair: LanguagePair) -> Lesson {
        let exercises = createExercises(
            phrases: ["How much is this?", "I'm just looking", "Can I try this on?", "Do you accept credit cards?", "I'll take it"],
            languagePair: languagePair
        )

        return Lesson(
            title: "Shopping Basics",
            category: .shopping,
            level: .intermediate,
            description: "Shop with confidence in any store",
            exercises: exercises,
            xpReward: 20,
            estimatedMinutes: 6
        )
    }

    static func createDirectionsLesson(for languagePair: LanguagePair) -> Lesson {
        let exercises = createExercises(
            phrases: ["I'm lost", "Turn right", "Turn left", "Go straight"],
            languagePair: languagePair
        )

        return Lesson(
            title: "Finding Your Way",
            category: .directions,
            level: .intermediate,
            description: "Ask for and understand directions",
            exercises: exercises,
            xpReward: 15,
            estimatedMinutes: 5
        )
    }

    static func createEmergenciesLesson(for languagePair: LanguagePair) -> Lesson {
        let exercises = createExercises(
            phrases: ["Help!", "Call the police", "I need a doctor", "Where is the hospital?"],
            languagePair: languagePair
        )

        return Lesson(
            title: "Emergency Phrases",
            category: .emergencies,
            level: .beginner,
            description: "Critical phrases for emergencies",
            exercises: exercises,
            xpReward: 20,
            estimatedMinutes: 4
        )
    }

    // MARK: - Exercise Creation Helper

    static func createExercises(phrases: [String], languagePair: LanguagePair) -> [Exercise] {
        var exercises: [Exercise] = []

        for phrase in phrases {
            guard let translationDict = translations[phrase],
                  let correctTranslation = translationDict[languagePair.learning.code] else {
                continue
            }

            // Create multiple choice exercise (Native -> Target)
            let wrongOptions = getWrongOptions(for: phrase, correctAnswer: correctTranslation, languagePair: languagePair)
            var allOptions = wrongOptions + [correctTranslation]
            allOptions.shuffle()

            let multipleChoiceExercise = Exercise(
                type: .multipleChoice,
                question: "Translate: \(phrase)",
                correctAnswer: correctTranslation,
                options: allOptions,
                hint: "Think about common \(languagePair.learning.displayName) phrases"
            )
            exercises.append(multipleChoiceExercise)

            // Create reverse multiple choice (Target -> Native)
            let reverseExercise = Exercise(
                type: .multipleChoice,
                question: "What does '\(correctTranslation)' mean?",
                correctAnswer: phrase,
                options: [phrase] + getWrongEnglishOptions(for: phrase),
                hint: nil
            )
            exercises.append(reverseExercise)
        }

        return exercises
    }

    static func getWrongOptions(for phrase: String, correctAnswer: String, languagePair: LanguagePair) -> [String] {
        var wrongOptions: [String] = []
        let allPhrases = Array(translations.keys)

        for wrongPhrase in allPhrases where wrongPhrase != phrase && wrongOptions.count < 3 {
            if let translationDict = translations[wrongPhrase],
               let translation = translationDict[languagePair.learning.code] {
                wrongOptions.append(translation)
            }
        }

        return Array(wrongOptions.prefix(3))
    }

    static func getWrongEnglishOptions(for correctPhrase: String) -> [String] {
        let allPhrases = Array(translations.keys).filter { $0 != correctPhrase }
        return Array(allPhrases.shuffled().prefix(3))
    }
}
