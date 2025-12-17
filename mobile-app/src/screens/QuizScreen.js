import React, { useState, useEffect } from 'react';
import {
  View,
  Text,
  TouchableOpacity,
  StyleSheet,
  SafeAreaView,
  StatusBar,
  Animated,
  Image
} from 'react-native';
import { LinearGradient } from 'expo-linear-gradient';
import { useApp } from '../contexts/AppContext';

export default function QuizScreen({ route, navigation }) {
  const { lesson } = route.params;
  const { user, completeLesson, loseHeart } = useApp();

  const [currentQuestionIndex, setCurrentQuestionIndex] = useState(0);
  const [selectedAnswer, setSelectedAnswer] = useState(null);
  const [showFeedback, setShowFeedback] = useState(false);
  const [isCorrect, setIsCorrect] = useState(false);
  const [score, setScore] = useState(0);
  const [timeLeft, setTimeLeft] = useState(40);
  const [hearts, setHearts] = useState(user.hearts);

  const currentQuestion = lesson.exercises[currentQuestionIndex];
  const totalQuestions = lesson.exercises.length;
  const progress = ((currentQuestionIndex + 1) / totalQuestions) * 100;

  // Timer
  useEffect(() => {
    if (timeLeft > 0 && !showFeedback) {
      const timer = setTimeout(() => setTimeLeft(timeLeft - 1), 1000);
      return () => clearTimeout(timer);
    }
  }, [timeLeft, showFeedback]);

  const formatTime = (seconds) => {
    const mins = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return `${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
  };

  const handleAnswerSelect = (answer) => {
    if (showFeedback) return;
    setSelectedAnswer(answer);
  };

  const handleSubmit = () => {
    if (!selectedAnswer) return;

    const correct = selectedAnswer.toLowerCase().trim() === currentQuestion.correctAnswer.toLowerCase().trim();
    setIsCorrect(correct);
    setShowFeedback(true);

    if (correct) {
      setScore(score + 1);
    } else {
      const newHearts = hearts - 1;
      setHearts(newHearts);
      loseHeart();
    }
  };

  const handleNext = () => {
    if (currentQuestionIndex < totalQuestions - 1) {
      setCurrentQuestionIndex(currentQuestionIndex + 1);
      setSelectedAnswer(null);
      setShowFeedback(false);
      setIsCorrect(false);
      setTimeLeft(40);
    } else {
      // Quiz complete
      const finalScore = (score / totalQuestions) * 10;
      completeLesson(lesson.id, finalScore);
      navigation.navigate('QuizResults', {
        lesson,
        score: finalScore,
        correctAnswers: score,
        totalQuestions
      });
    }
  };

  const getOptionStyle = (option) => {
    if (!showFeedback) {
      return selectedAnswer === option ? styles.optionSelected : styles.option;
    }

    if (option === currentQuestion.correctAnswer) {
      return [styles.option, styles.optionCorrect];
    }

    if (selectedAnswer === option && !isCorrect) {
      return [styles.option, styles.optionWrong];
    }

    return styles.option;
  };

  const getOptionTextStyle = (option) => {
    if (!showFeedback) {
      return selectedAnswer === option ? styles.optionTextSelected : styles.optionText;
    }

    if (option === currentQuestion.correctAnswer) {
      return styles.optionTextCorrect;
    }

    if (selectedAnswer === option && !isCorrect) {
      return styles.optionTextWrong;
    }

    return styles.optionText;
  };

  return (
    <SafeAreaView style={styles.container}>
      <StatusBar barStyle="light-content" />

      <LinearGradient
        colors={['#22C55E', '#16A34A']}
        style={styles.gradient}
      >
        {/* Header */}
        <View style={styles.header}>
          <TouchableOpacity
            style={styles.backButton}
            onPress={() => navigation.goBack()}
          >
            <Text style={styles.backIcon}>←</Text>
          </TouchableOpacity>

          <Text style={styles.quizTitle}>Quiz</Text>

          <View style={styles.heartsContainer}>
            <Text style={styles.heartIcon}>❤️</Text>
            <Text style={styles.heartsText}>{hearts}</Text>
          </View>
        </View>

        {/* Timer and Progress */}
        <View style={styles.timerContainer}>
          <View style={styles.timerBar}>
            <Text style={styles.timerText}>{formatTime(timeLeft)}</Text>
          </View>
          <TouchableOpacity style={styles.timerIcon}>
            <Text>⏱️</Text>
          </TouchableOpacity>
        </View>

        {/* Question Card */}
        <View style={styles.questionCard}>
          <View style={styles.questionHeader}>
            <Text style={styles.questionNumber}>
              Question {currentQuestionIndex + 1}/{totalQuestions}
            </Text>
            <View style={styles.languageBadge}>
              <Text style={styles.languageFlag}>🇺🇸</Text>
              <Text style={styles.languageText}>English (USA)</Text>
            </View>
          </View>

          <Text style={styles.categoryLabel}>{currentQuestion.category || 'Vocabulary'}</Text>
          <Text style={styles.questionText}>{currentQuestion.question}</Text>

          {/* Render based on question type */}
          {currentQuestion.type === 'multipleChoice' && (
            <View style={styles.optionsContainer}>
              {currentQuestion.options.map((option, index) => (
                <TouchableOpacity
                  key={index}
                  style={getOptionStyle(option)}
                  onPress={() => handleAnswerSelect(option)}
                  disabled={showFeedback}
                >
                  <Text style={getOptionTextStyle(option)}>{option}</Text>
                  {showFeedback && option === currentQuestion.correctAnswer && (
                    <View style={styles.checkIcon}>
                      <Text style={styles.checkText}>✓</Text>
                    </View>
                  )}
                  {showFeedback && selectedAnswer === option && !isCorrect && (
                    <View style={styles.crossIcon}>
                      <Text style={styles.crossText}>✕</Text>
                    </View>
                  )}
                </TouchableOpacity>
              ))}
            </View>
          )}

          {/* Listening Practice Example */}
          {currentQuestion.type === 'listening' && (
            <View style={styles.listeningContainer}>
              <View style={styles.audioPlayer}>
                <Image
                  source={{ uri: 'https://via.placeholder.com/300x200' }}
                  style={styles.audioImage}
                />
                <View style={styles.audioControls}>
                  <TouchableOpacity style={styles.playButton}>
                    <Text style={styles.playIcon}>▶️</Text>
                  </TouchableOpacity>
                  <View style={styles.waveform}>
                    <Text style={styles.waveformText}>||||||||||||||||</Text>
                  </View>
                  <Text style={styles.audioDuration}>0:16</Text>
                </View>
              </View>

              <View style={styles.wordChips}>
                {['Emma', 'was', 'playing', 'in the park', 'when', 'she heard'].map((word, idx) => (
                  <TouchableOpacity key={idx} style={styles.wordChip}>
                    <Text style={styles.wordChipText}>{word}</Text>
                  </TouchableOpacity>
                ))}
              </View>

              <View style={styles.optionsContainer}>
                {['A bark', 'A soft whimper', 'Rustle'].map((option, index) => (
                  <TouchableOpacity
                    key={index}
                    style={[
                      styles.option,
                      selectedAnswer === option && styles.optionSelected
                    ]}
                    onPress={() => handleAnswerSelect(option)}
                  >
                    <Text style={styles.optionText}>{option}</Text>
                  </TouchableOpacity>
                ))}
              </View>
            </View>
          )}
        </View>

        {/* Next Question Button */}
        {!showFeedback ? (
          <TouchableOpacity
            style={[styles.nextButton, !selectedAnswer && styles.nextButtonDisabled]}
            onPress={handleSubmit}
            disabled={!selectedAnswer}
          >
            <Text style={styles.nextButtonText}>Check Answer</Text>
          </TouchableOpacity>
        ) : (
          <TouchableOpacity style={styles.nextButton} onPress={handleNext}>
            <Text style={styles.nextButtonText}>Next Question</Text>
          </TouchableOpacity>
        )}

        {/* Feedback */}
        {showFeedback && (
          <View style={[
            styles.feedbackBanner,
            isCorrect ? styles.feedbackCorrect : styles.feedbackWrong
          ]}>
            <Text style={styles.feedbackText}>
              {isCorrect ? '✓ Correct!' : '✕ Not quite'}
            </Text>
            {!isCorrect && (
              <Text style={styles.feedbackAnswer}>
                Correct answer: {currentQuestion.correctAnswer}
              </Text>
            )}
          </View>
        )}
      </LinearGradient>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  gradient: {
    flex: 1,
  },
  header: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingHorizontal: 20,
    paddingTop: 20,
    paddingBottom: 16,
  },
  backButton: {
    width: 40,
    height: 40,
    borderRadius: 20,
    backgroundColor: 'rgba(255, 255, 255, 0.3)',
    justifyContent: 'center',
    alignItems: 'center',
  },
  backIcon: {
    fontSize: 20,
    color: '#FFFFFF',
    fontWeight: '600',
  },
  quizTitle: {
    fontSize: 20,
    fontWeight: '700',
    color: '#FFFFFF',
  },
  heartsContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#FFFFFF',
    paddingHorizontal: 12,
    paddingVertical: 6,
    borderRadius: 20,
  },
  heartIcon: {
    fontSize: 18,
    marginRight: 6,
  },
  heartsText: {
    fontSize: 16,
    fontWeight: '700',
    color: '#111827',
  },
  timerContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: 20,
    marginBottom: 20,
  },
  timerBar: {
    flex: 1,
    height: 32,
    backgroundColor: 'rgba(255, 255, 255, 0.9)',
    borderRadius: 16,
    justifyContent: 'center',
    paddingHorizontal: 16,
    marginRight: 12,
  },
  timerText: {
    fontSize: 14,
    fontWeight: '600',
    color: '#111827',
  },
  timerIcon: {
    width: 32,
    height: 32,
    justifyContent: 'center',
    alignItems: 'center',
  },
  questionCard: {
    flex: 1,
    backgroundColor: '#FFFFFF',
    borderTopLeftRadius: 32,
    borderTopRightRadius: 32,
    padding: 20,
  },
  questionHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 16,
  },
  questionNumber: {
    fontSize: 14,
    color: '#9CA3AF',
    fontWeight: '500',
  },
  languageBadge: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#F3F4F6',
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 12,
  },
  languageFlag: {
    fontSize: 16,
    marginRight: 6,
  },
  languageText: {
    fontSize: 12,
    color: '#374151',
    fontWeight: '500',
  },
  categoryLabel: {
    fontSize: 14,
    fontWeight: '600',
    color: '#22C55E',
    marginBottom: 8,
  },
  questionText: {
    fontSize: 22,
    fontWeight: '700',
    color: '#111827',
    marginBottom: 24,
    lineHeight: 30,
  },
  optionsContainer: {
    marginTop: 12,
  },
  option: {
    backgroundColor: '#F9FAFB',
    borderWidth: 2,
    borderColor: '#E5E7EB',
    borderRadius: 16,
    paddingVertical: 16,
    paddingHorizontal: 20,
    marginBottom: 12,
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  optionSelected: {
    backgroundColor: '#DBEAFE',
    borderColor: '#3B82F6',
  },
  optionCorrect: {
    backgroundColor: '#D1FAE5',
    borderColor: '#22C55E',
  },
  optionWrong: {
    backgroundColor: '#FEE2E2',
    borderColor: '#EF4444',
  },
  optionText: {
    fontSize: 16,
    color: '#374151',
    fontWeight: '500',
  },
  optionTextSelected: {
    fontSize: 16,
    color: '#1F2937',
    fontWeight: '600',
  },
  optionTextCorrect: {
    fontSize: 16,
    color: '#166534',
    fontWeight: '600',
  },
  optionTextWrong: {
    fontSize: 16,
    color: '#991B1B',
    fontWeight: '600',
  },
  checkIcon: {
    width: 24,
    height: 24,
    borderRadius: 12,
    backgroundColor: '#22C55E',
    justifyContent: 'center',
    alignItems: 'center',
  },
  checkText: {
    color: '#FFFFFF',
    fontSize: 14,
    fontWeight: '700',
  },
  crossIcon: {
    width: 24,
    height: 24,
    borderRadius: 12,
    backgroundColor: '#EF4444',
    justifyContent: 'center',
    alignItems: 'center',
  },
  crossText: {
    color: '#FFFFFF',
    fontSize: 14,
    fontWeight: '700',
  },
  listeningContainer: {
    marginTop: 12,
  },
  audioPlayer: {
    backgroundColor: '#F3F4F6',
    borderRadius: 20,
    padding: 16,
    marginBottom: 20,
  },
  audioImage: {
    width: '100%',
    height: 200,
    borderRadius: 16,
    backgroundColor: '#E5E7EB',
    marginBottom: 12,
  },
  audioControls: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  playButton: {
    width: 40,
    height: 40,
    borderRadius: 20,
    backgroundColor: '#22C55E',
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 12,
  },
  playIcon: {
    fontSize: 16,
    color: '#FFFFFF',
  },
  waveform: {
    flex: 1,
    height: 24,
    justifyContent: 'center',
  },
  waveformText: {
    fontSize: 12,
    color: '#22C55E',
    letterSpacing: 2,
  },
  audioDuration: {
    fontSize: 12,
    color: '#6B7280',
    fontWeight: '500',
  },
  wordChips: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    marginBottom: 20,
  },
  wordChip: {
    backgroundColor: '#D1FAE5',
    paddingHorizontal: 14,
    paddingVertical: 8,
    borderRadius: 16,
    marginRight: 8,
    marginBottom: 8,
  },
  wordChipText: {
    fontSize: 14,
    color: '#166534',
    fontWeight: '500',
  },
  nextButton: {
    backgroundColor: '#FFFFFF',
    marginHorizontal: 20,
    marginBottom: 20,
    paddingVertical: 16,
    borderRadius: 16,
    alignItems: 'center',
  },
  nextButtonDisabled: {
    backgroundColor: 'rgba(255, 255, 255, 0.5)',
  },
  nextButtonText: {
    fontSize: 16,
    fontWeight: '700',
    color: '#111827',
  },
  feedbackBanner: {
    position: 'absolute',
    bottom: 0,
    left: 0,
    right: 0,
    padding: 20,
  },
  feedbackCorrect: {
    backgroundColor: '#22C55E',
  },
  feedbackWrong: {
    backgroundColor: '#EF4444',
  },
  feedbackText: {
    fontSize: 18,
    fontWeight: '700',
    color: '#FFFFFF',
    marginBottom: 4,
  },
  feedbackAnswer: {
    fontSize: 14,
    color: 'rgba(255, 255, 255, 0.9)',
  },
});
