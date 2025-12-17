// Translation dictionary for all supported languages
export const translations = {
  // Greetings
  "Hello": {
    "pt-BR": "Olá",
    "es": "Hola",
    "fr": "Bonjour",
    "nl": "Hallo"
  },
  "Good morning": {
    "pt-BR": "Bom dia",
    "es": "Buenos días",
    "fr": "Bonjour",
    "nl": "Goedemorgen"
  },
  "Good afternoon": {
    "pt-BR": "Boa tarde",
    "es": "Buenas tardes",
    "fr": "Bon après-midi",
    "nl": "Goedemiddag"
  },
  "Good evening": {
    "pt-BR": "Boa noite",
    "es": "Buenas noches",
    "fr": "Bonsoir",
    "nl": "Goedenavond"
  },
  "How are you?": {
    "pt-BR": "Como você está?",
    "es": "¿Cómo estás?",
    "fr": "Comment allez-vous?",
    "nl": "Hoe gaat het?"
  },
  "I'm fine, thank you": {
    "pt-BR": "Estou bem, obrigado",
    "es": "Estoy bien, gracias",
    "fr": "Je vais bien, merci",
    "nl": "Het gaat goed, dank je"
  },
  "What's your name?": {
    "pt-BR": "Qual é o seu nome?",
    "es": "¿Cómo te llamas?",
    "fr": "Comment vous appelez-vous?",
    "nl": "Hoe heet je?"
  },
  "My name is...": {
    "pt-BR": "Meu nome é...",
    "es": "Me llamo...",
    "fr": "Je m'appelle...",
    "nl": "Ik heet..."
  },
  "Nice to meet you": {
    "pt-BR": "Prazer em conhecê-lo",
    "es": "Encantado de conocerte",
    "fr": "Enchanté",
    "nl": "Aangenaam"
  },
  "Goodbye": {
    "pt-BR": "Tchau",
    "es": "Adiós",
    "fr": "Au revoir",
    "nl": "Tot ziens"
  },

  // Food & Dining
  "I would like a coffee": {
    "pt-BR": "Eu gostaria de um café",
    "es": "Quisiera un café",
    "fr": "Je voudrais un café",
    "nl": "Ik wil graag een koffie"
  },
  "Can I see the menu?": {
    "pt-BR": "Posso ver o cardápio?",
    "es": "¿Puedo ver el menú?",
    "fr": "Puis-je voir le menu?",
    "nl": "Mag ik de menukaart zien?"
  },
  "The check, please": {
    "pt-BR": "A conta, por favor",
    "es": "La cuenta, por favor",
    "fr": "L'addition, s'il vous plaît",
    "nl": "De rekening, alstublieft"
  },
  "This is delicious": {
    "pt-BR": "Isto está delicioso",
    "es": "Esto está delicioso",
    "fr": "C'est délicieux",
    "nl": "Dit is heerlijk"
  },
  "I'm vegetarian": {
    "pt-BR": "Sou vegetariano",
    "es": "Soy vegetariano",
    "fr": "Je suis végétarien",
    "nl": "Ik ben vegetariër"
  },
  "Water, please": {
    "pt-BR": "Água, por favor",
    "es": "Agua, por favor",
    "fr": "De l'eau, s'il vous plaît",
    "nl": "Water, alstublieft"
  },

  // Travel
  "Where is the bathroom?": {
    "pt-BR": "Onde fica o banheiro?",
    "es": "¿Dónde está el baño?",
    "fr": "Où sont les toilettes?",
    "nl": "Waar is het toilet?"
  },
  "How much does it cost?": {
    "pt-BR": "Quanto custa?",
    "es": "¿Cuánto cuesta?",
    "fr": "Combien ça coûte?",
    "nl": "Hoeveel kost het?"
  },
  "I need help": {
    "pt-BR": "Preciso de ajuda",
    "es": "Necesito ayuda",
    "fr": "J'ai besoin d'aide",
    "nl": "Ik heb hulp nodig"
  },
  "Do you speak English?": {
    "pt-BR": "Você fala inglês?",
    "es": "¿Hablas inglés?",
    "fr": "Parlez-vous anglais?",
    "nl": "Spreek je Engels?"
  },
  "I don't understand": {
    "pt-BR": "Eu não entendo",
    "es": "No entiendo",
    "fr": "Je ne comprends pas",
    "nl": "Ik begrijp het niet"
  },

  // Basics
  "Yes": {
    "pt-BR": "Sim",
    "es": "Sí",
    "fr": "Oui",
    "nl": "Ja"
  },
  "No": {
    "pt-BR": "Não",
    "es": "No",
    "fr": "Non",
    "nl": "Nee"
  },
  "Please": {
    "pt-BR": "Por favor",
    "es": "Por favor",
    "fr": "S'il vous plaît",
    "nl": "Alstublieft"
  },
  "Thank you": {
    "pt-BR": "Obrigado",
    "es": "Gracias",
    "fr": "Merci",
    "nl": "Dank je"
  },
  "You're welcome": {
    "pt-BR": "De nada",
    "es": "De nada",
    "fr": "De rien",
    "nl": "Graag gedaan"
  },
  "I'm sorry": {
    "pt-BR": "Desculpe",
    "es": "Lo siento",
    "fr": "Je suis désolé",
    "nl": "Het spijt me"
  },
  "Excuse me": {
    "pt-BR": "Com licença",
    "es": "Disculpe",
    "fr": "Excusez-moi",
    "nl": "Pardon"
  }
};

// Vocabulary questions with opposites and meanings
const vocabularyQuestions = [
  {
    id: 'vocab-1',
    type: 'multipleChoice',
    question: 'What is the opposite of "cold"?',
    correctAnswer: 'Hot',
    options: ['Hot', 'Warm', 'Cool'],
    category: 'Vocabulary'
  },
  {
    id: 'vocab-2',
    type: 'multipleChoice',
    question: 'What is the opposite of "big"?',
    correctAnswer: 'Small',
    options: ['Small', 'Tiny', 'Little'],
    category: 'Vocabulary'
  },
  {
    id: 'vocab-3',
    type: 'multipleChoice',
    question: 'What is the opposite of "fast"?',
    correctAnswer: 'Slow',
    options: ['Slow', 'Quick', 'Rapid'],
    category: 'Vocabulary'
  },
  {
    id: 'vocab-4',
    type: 'multipleChoice',
    question: 'What does "happy" mean?',
    correctAnswer: 'Feeling joy',
    options: ['Feeling joy', 'Feeling sad', 'Feeling angry'],
    category: 'Vocabulary'
  }
];

// Spelling questions
const spellingQuestions = [
  {
    id: 'spell-1',
    type: 'multipleChoice',
    question: 'Which word is spelled correctly?',
    correctAnswer: 'Receive',
    options: ['Recieve', 'Receive', 'Recive'],
    category: 'Spelling'
  },
  {
    id: 'spell-2',
    type: 'multipleChoice',
    question: 'Which word is spelled correctly?',
    correctAnswer: 'Definitely',
    options: ['Definately', 'Definitely', 'Definetly'],
    category: 'Spelling'
  },
  {
    id: 'spell-3',
    type: 'multipleChoice',
    question: 'Which word is spelled correctly?',
    correctAnswer: 'Separate',
    options: ['Seperate', 'Separate', 'Seperete'],
    category: 'Spelling'
  },
  {
    id: 'spell-4',
    type: 'multipleChoice',
    question: 'Which word is spelled correctly?',
    correctAnswer: 'Necessary',
    options: ['Necesary', 'Necessary', 'Neccessary'],
    category: 'Spelling'
  }
];

// Listening practice questions
const listeningQuestions = [
  {
    id: 'listen-1',
    type: 'listening',
    question: 'Listen Carefully: Master English Audio',
    correctAnswer: 'A soft whimper',
    options: ['A bark', 'A soft whimper', 'Rustle'],
    wordChips: ['Emma', 'was', 'playing', 'in the park', 'when', 'she heard'],
    audioFile: 'audio1.mp3',
    category: 'Listening Practice'
  },
  {
    id: 'listen-2',
    type: 'listening',
    question: 'Listen Carefully: Understand the Sentence',
    correctAnswer: 'Going to the store',
    options: ['Going to the store', 'Coming from work', 'Staying at home'],
    wordChips: ['I', 'am', 'going', 'to', 'the', 'store'],
    audioFile: 'audio2.mp3',
    category: 'Listening Practice'
  }
];

// Generate exercises from phrases
const createExercises = (phrases, nativeCode, learningCode) => {
  const exercises = [];
  const allPhrases = Object.keys(translations);

  phrases.forEach((phrase, index) => {
    const translation = translations[phrase]?.[learningCode];
    if (!translation) return;

    // Get wrong options
    const wrongOptions = allPhrases
      .filter(p => p !== phrase)
      .slice(0, 3)
      .map(p => translations[p]?.[learningCode])
      .filter(Boolean);

    const allOptions = [translation, ...wrongOptions].sort(() => Math.random() - 0.5);

    // Multiple choice exercise
    exercises.push({
      id: `ex-${index}-mc`,
      type: 'multipleChoice',
      question: `Translate: ${phrase}`,
      correctAnswer: translation,
      options: allOptions,
      hint: `Common ${learningCode} phrase`,
      category: 'Translation'
    });

    // Reverse exercise
    const reverseOptions = [phrase, ...allPhrases.filter(p => p !== phrase).slice(0, 3)]
      .sort(() => Math.random() - 0.5);

    exercises.push({
      id: `ex-${index}-rev`,
      type: 'multipleChoice',
      question: `What does "${translation}" mean?`,
      correctAnswer: phrase,
      options: reverseOptions,
      hint: null,
      category: 'Translation'
    });
  });

  return exercises;
};

// Mix different question types
const createMixedExercises = (phrases, nativeCode, learningCode) => {
  const translationExercises = createExercises(phrases, nativeCode, learningCode);

  // Mix in vocabulary, spelling, and listening questions
  const mixed = [
    ...translationExercises.slice(0, 3),
    ...vocabularyQuestions.slice(0, 2),
    ...spellingQuestions.slice(0, 2),
    ...listeningQuestions.slice(0, 1),
    ...translationExercises.slice(3, 5)
  ];

  return mixed.slice(0, 10); // Return 10 questions per lesson
};

// Lesson definitions with new design styling
export const getLessons = (nativeCode, learningCode) => {
  return [
    {
      id: 'lesson-1',
      title: 'Business English Vocabulary',
      category: 'Business',
      icon: '💼',
      color: '#F97316', // Orange
      estimatedMinutes: 10,
      totalQuestions: 10,
      lessonNumber: '3 of 5',
      completionPercentage: 80,
      exercises: createMixedExercises(
        ['Hello', 'Thank you', 'Please', 'Yes', 'No'],
        nativeCode,
        learningCode
      )
    },
    {
      id: 'lesson-2',
      title: 'Fun Grammar & Sentence',
      category: 'Grammar',
      icon: '🎯',
      color: '#22C55E', // Green
      estimatedMinutes: 10,
      totalQuestions: 10,
      lessonNumber: '3 of 5',
      completionPercentage: 80,
      exercises: createMixedExercises(
        ['How are you?', 'I\'m fine, thank you', 'What\'s your name?', 'My name is...', 'Nice to meet you'],
        nativeCode,
        learningCode
      )
    },
    {
      id: 'lesson-3',
      title: 'Word Puzzles & Vocabulary',
      category: 'Vocabulary',
      icon: '🧩',
      color: '#8B5CF6', // Purple
      estimatedMinutes: 10,
      totalQuestions: 10,
      lessonNumber: '3 of 5',
      completionPercentage: 80,
      exercises: createMixedExercises(
        ['Good morning', 'Good afternoon', 'Good evening', 'Goodbye'],
        nativeCode,
        learningCode
      )
    },
    {
      id: 'lesson-4',
      title: 'Travel Essentials',
      category: 'Travel',
      icon: '✈️',
      color: '#06B6D4', // Cyan
      estimatedMinutes: 10,
      totalQuestions: 10,
      lessonNumber: '1 of 5',
      completionPercentage: 20,
      exercises: createMixedExercises(
        ['Where is the bathroom?', 'How much does it cost?', 'I need help', 'Do you speak English?'],
        nativeCode,
        learningCode
      )
    },
    {
      id: 'lesson-5',
      title: 'Food & Dining',
      category: 'Dining',
      icon: '🍽️',
      color: '#EF4444', // Red
      estimatedMinutes: 10,
      totalQuestions: 10,
      lessonNumber: '2 of 5',
      completionPercentage: 50,
      exercises: createMixedExercises(
        ['I would like a coffee', 'Can I see the menu?', 'The check, please', 'This is delicious', 'Water, please'],
        nativeCode,
        learningCode
      )
    },
    {
      id: 'lesson-6',
      title: 'Beginner Essentials',
      category: 'Basics',
      icon: '🌱',
      color: '#10B981', // Emerald
      estimatedMinutes: 5,
      totalQuestions: 8,
      lessonNumber: '1 of 3',
      completionPercentage: 0,
      exercises: createMixedExercises(
        ['Excuse me', 'I\'m sorry', 'I don\'t understand'],
        nativeCode,
        learningCode
      )
    },
    {
      id: 'lesson-7',
      title: 'Intermediate Mastery',
      category: 'Advanced',
      icon: '🏆',
      color: '#F59E0B', // Amber
      estimatedMinutes: 15,
      totalQuestions: 12,
      lessonNumber: '1 of 4',
      completionPercentage: 0,
      exercises: createMixedExercises(
        ['I\'m vegetarian', 'You\'re welcome'],
        nativeCode,
        learningCode
      )
    }
  ];
};

export const languages = {
  'en': { name: 'English', flag: '🇺🇸', fullName: 'English (USA)' },
  'pt-BR': { name: 'Portuguese', flag: '🇧🇷', fullName: 'Brazilian Portuguese' },
  'es': { name: 'Spanish', flag: '🇪🇸', fullName: 'Spanish' },
  'fr': { name: 'French', flag: '🇫🇷', fullName: 'French' },
  'nl': { name: 'Dutch', flag: '🇳🇱', fullName: 'Dutch' }
};
