import Foundation

class LessonContent {

    // MARK: - Translation Dictionaries (same as before, keeping existing translations)

    static let translations: [String: [String: String]] = [
        // Greetings
        "Hello": ["pt-BR": "Olá", "es": "Hola", "fr": "Bonjour", "nl": "Hallo"],
        "Good morning": ["pt-BR": "Bom dia", "es": "Buenos días", "fr": "Bonjour", "nl": "Goedemorgen"],
        "Good afternoon": ["pt-BR": "Boa tarde", "es": "Buenas tardes", "fr": "Bon après-midi", "nl": "Goedemiddag"],
        "Good evening": ["pt-BR": "Boa noite", "es": "Buenas noches", "fr": "Bonsoir", "nl": "Goedenavond"],
        "How are you?": ["pt-BR": "Como você está?", "es": "¿Cómo estás?", "fr": "Comment allez-vous?", "nl": "Hoe gaat het?"],
        "I'm fine, thank you": ["pt-BR": "Estou bem, obrigado", "es": "Estoy bien, gracias", "fr": "Je vais bien, merci", "nl": "Het gaat goed, dank je"],
        "What's your name?": ["pt-BR": "Qual é o seu nome?", "es": "¿Cómo te llamas?", "fr": "Comment vous appelez-vous?", "nl": "Hoe heet je?"],
        "My name is...": ["pt-BR": "Meu nome é...", "es": "Me llamo...", "fr": "Je m'appelle...", "nl": "Ik heet..."],
        "Nice to meet you": ["pt-BR": "Prazer em conhecê-lo", "es": "Encantado de conocerte", "fr": "Enchanté", "nl": "Aangenaam"],
        "Goodbye": ["pt-BR": "Tchau", "es": "Adiós", "fr": "Au revoir", "nl": "Tot ziens"],

        // Food & Dining
        "I would like a coffee": ["pt-BR": "Eu gostaria de um café", "es": "Quisiera un café", "fr": "Je voudrais un café", "nl": "Ik wil graag een koffie"],
        "Can I see the menu?": ["pt-BR": "Posso ver o cardápio?", "es": "¿Puedo ver el menú?", "fr": "Puis-je voir le menu?", "nl": "Mag ik de menukaart zien?"],
        "The check, please": ["pt-BR": "A conta, por favor", "es": "La cuenta, por favor", "fr": "L'addition, s'il vous plaît", "nl": "De rekening, alstublieft"],
        "This is delicious": ["pt-BR": "Isto está delicioso", "es": "Esto está delicioso", "fr": "C'est délicieux", "nl": "Dit is heerlijk"],
        "I'm vegetarian": ["pt-BR": "Sou vegetariano", "es": "Soy vegetariano", "fr": "Je suis végétarien", "nl": "Ik ben vegetariër"],
        "Water, please": ["pt-BR": "Água, por favor", "es": "Agua, por favor", "fr": "De l'eau, s'il vous plaît", "nl": "Water, alstublieft"],

        // Travel
        "Where is the bathroom?": ["pt-BR": "Onde fica o banheiro?", "es": "¿Dónde está el baño?", "fr": "Où sont les toilettes?", "nl": "Waar is het toilet?"],
        "How much does it cost?": ["pt-BR": "Quanto custa?", "es": "¿Cuánto cuesta?", "fr": "Combien ça coûte?", "nl": "Hoeveel kost het?"],
        "I need help": ["pt-BR": "Preciso de ajuda", "es": "Necesito ayuda", "fr": "J'ai besoin d'aide", "nl": "Ik heb hulp nodig"],
        "Do you speak English?": ["pt-BR": "Você fala inglês?", "es": "¿Hablas inglés?", "fr": "Parlez-vous anglais?", "nl": "Spreek je Engels?"],
        "I don't understand": ["pt-BR": "Eu não entendo", "es": "No entiendo", "fr": "Je ne comprends pas", "nl": "Ik begrijp het niet"],

        // Basics
        "Yes": ["pt-BR": "Sim", "es": "Sí", "fr": "Oui", "nl": "Ja"],
        "No": ["pt-BR": "Não", "es": "No", "fr": "Non", "nl": "Nee"],
        "Please": ["pt-BR": "Por favor", "es": "Por favor", "fr": "S'il vous plaît", "nl": "Alstublieft"],
        "Thank you": ["pt-BR": "Obrigado", "es": "Gracias", "fr": "Merci", "nl": "Dank je"],
        "You're welcome": ["pt-BR": "De nada", "es": "De nada", "fr": "De rien", "nl": "Graag gedaan"],
        "I'm sorry": ["pt-BR": "Desculpe", "es": "Lo siento", "fr": "Je suis désolé", "nl": "Het spijt me"],
        "Excuse me": ["pt-BR": "Com licença", "es": "Disculpe", "fr": "Excusez-moi", "nl": "Pardon"]
    ]

    // MARK: - Lesson Generation with new design fields

    static func getLessons(for languagePair: LanguagePair) -> [Lesson] {
        var lessons: [Lesson] = []

        // Business English Vocabulary - Orange theme
        lessons.append(Lesson(
            title: "Business English Vocabulary",
            category: .basics,
            level: .intermediate,
            description: "Essential business English phrases",
            exercises: createExercises(phrases: ["Thank you", "Please", "Yes", "No"], languagePair: languagePair),
            xpReward: 10,
            estimatedMinutes: 10,
            lessonNumber: "3 of 5",
            completionPercentage: 80,
            icon: "💼",
            themeColor: "orange"
        ))

        // Fun Grammar & Sentence - Green theme
        lessons.append(Lesson(
            title: "Fun Grammar & Sentence",
            category: .greetings,
            level: .beginner,
            description: "Master grammar with fun exercises",
            exercises: createExercises(phrases: ["How are you?", "I'm fine, thank you", "What's your name?", "My name is..."], languagePair: languagePair),
            xpReward: 10,
            estimatedMinutes: 10,
            lessonNumber: "3 of 5",
            completionPercentage: 80,
            icon: "🎯",
            themeColor: "green"
        ))

        // Word Puzzles & Vocabulary - Purple theme
        lessons.append(Lesson(
            title: "Word Puzzles & Vocabulary",
            category: .conversation,
            level: .beginner,
            description: "Expand your vocabulary with puzzles",
            exercises: createExercises(phrases: ["Hello", "Goodbye", "Nice to meet you"], languagePair: languagePair),
            xpReward: 10,
            estimatedMinutes: 10,
            lessonNumber: "3 of 5",
            completionPercentage: 80,
            icon: "🧩",
            themeColor: "purple"
        ))

        // Travel Essentials - Cyan theme
        lessons.append(Lesson(
            title: "Travel Essentials",
            category: .travel,
            level: .beginner,
            description: "Essential phrases for traveling",
            exercises: createExercises(phrases: ["Where is the bathroom?", "How much does it cost?", "I need help", "Do you speak English?"], languagePair: languagePair),
            xpReward: 10,
            estimatedMinutes: 10,
            lessonNumber: "1 of 5",
            completionPercentage: 20,
            icon: "✈️",
            themeColor: "cyan"
        ))

        // Food & Dining - Red theme
        lessons.append(Lesson(
            title: "Food & Dining",
            category: .food,
            level: .beginner,
            description: "Order food like a local",
            exercises: createExercises(phrases: ["I would like a coffee", "Can I see the menu?", "The check, please", "Water, please"], languagePair: languagePair),
            xpReward: 10,
            estimatedMinutes: 10,
            lessonNumber: "2 of 5",
            completionPercentage: 50,
            icon: "🍽️",
            themeColor: "red"
        ))

        // Beginner Essentials - Green theme
        lessons.append(Lesson(
            title: "Beginner Essentials",
            category: .basics,
            level: .beginner,
            description: "Learn basic vocabulary and phrases",
            exercises: createExercises(phrases: ["Excuse me", "I'm sorry", "I don't understand"], languagePair: languagePair),
            xpReward: 5,
            estimatedMinutes: 5,
            lessonNumber: "1 of 3",
            completionPercentage: 0,
            icon: "🌱",
            themeColor: "emerald"
        ))

        // Intermediate Mastery - Amber theme
        lessons.append(Lesson(
            title: "Intermediate Mastery",
            category: .conversation,
            level: .intermediate,
            description: "Expanding vocabulary and conversation skills",
            exercises: createExercises(phrases: ["Good morning", "Good afternoon", "Good evening"], languagePair: languagePair),
            xpReward: 15,
            estimatedMinutes: 15,
            lessonNumber: "1 of 4",
            completionPercentage: 0,
            icon: "🏆",
            themeColor: "amber"
        ))

        return lessons
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
