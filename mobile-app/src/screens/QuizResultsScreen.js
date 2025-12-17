import React from 'react';
import {
  View,
  Text,
  TouchableOpacity,
  StyleSheet,
  SafeAreaView,
  StatusBar
} from 'react-native';
import { LinearGradient } from 'expo-linear-gradient';

export default function QuizResultsScreen({ route, navigation }) {
  const { lesson, score, correctAnswers, totalQuestions } = route.params;

  const percentage = Math.round((correctAnswers / totalQuestions) * 100);
  const stars = percentage >= 90 ? 3 : percentage >= 70 ? 2 : percentage >= 50 ? 1 : 0;

  return (
    <SafeAreaView style={styles.container}>
      <StatusBar barStyle="light-content" />

      <LinearGradient
        colors={['#22C55E', '#16A34A']}
        style={styles.gradient}
      >
        <View style={styles.content}>
          {/* Trophy */}
          <Text style={styles.trophy}>{stars >= 2 ? '🏆' : stars >= 1 ? '👍' : '💪'}</Text>

          {/* Title */}
          <Text style={styles.title}>
            {stars >= 2 ? 'Excellent!' : stars >= 1 ? 'Good Job!' : 'Keep Practicing!'}
          </Text>

          {/* Score */}
          <Text style={styles.score}>{percentage}%</Text>

          {/* Stars */}
          <View style={styles.starsContainer}>
            {[1, 2, 3].map((star) => (
              <Text key={star} style={styles.star}>
                {star <= stars ? '⭐' : '☆'}
              </Text>
            ))}
          </View>

          {/* Stats Card */}
          <View style={styles.statsCard}>
            <View style={styles.statRow}>
              <Text style={styles.statLabel}>Correct Answers</Text>
              <Text style={styles.statValue}>{correctAnswers}/{totalQuestions}</Text>
            </View>
            <View style={styles.statDivider} />
            <View style={styles.statRow}>
              <Text style={styles.statLabel}>XP Earned</Text>
              <Text style={[styles.statValue, styles.xpValue]}>+{Math.floor(score * 10)}</Text>
            </View>
          </View>

          {/* Buttons */}
          <TouchableOpacity
            style={styles.continueButton}
            onPress={() => navigation.navigate('Home')}
          >
            <Text style={styles.continueButtonText}>Continue</Text>
          </TouchableOpacity>

          {percentage < 100 && (
            <TouchableOpacity
              style={styles.retryButton}
              onPress={() => navigation.navigate('Quiz', { lesson })}
            >
              <Text style={styles.retryButtonText}>Practice Again</Text>
            </TouchableOpacity>
          )}
        </View>
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
  content: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    padding: 20,
  },
  trophy: {
    fontSize: 80,
    marginBottom: 20,
  },
  title: {
    fontSize: 36,
    fontWeight: '700',
    color: '#FFFFFF',
    marginBottom: 16,
  },
  score: {
    fontSize: 56,
    fontWeight: '700',
    color: '#FFFFFF',
    marginBottom: 24,
  },
  starsContainer: {
    flexDirection: 'row',
    marginBottom: 40,
  },
  star: {
    fontSize: 40,
    marginHorizontal: 8,
  },
  statsCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 20,
    padding: 24,
    width: '100%',
    marginBottom: 32,
  },
  statRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  statDivider: {
    height: 1,
    backgroundColor: '#E5E7EB',
    marginVertical: 16,
  },
  statLabel: {
    fontSize: 16,
    color: '#6B7280',
  },
  statValue: {
    fontSize: 18,
    fontWeight: '700',
    color: '#111827',
  },
  xpValue: {
    color: '#22C55E',
  },
  continueButton: {
    backgroundColor: '#FCD34D',
    width: '100%',
    paddingVertical: 16,
    borderRadius: 16,
    alignItems: 'center',
    marginBottom: 12,
  },
  continueButtonText: {
    fontSize: 18,
    fontWeight: '700',
    color: '#111827',
  },
  retryButton: {
    backgroundColor: 'transparent',
    borderWidth: 2,
    borderColor: '#FFFFFF',
    width: '100%',
    paddingVertical: 16,
    borderRadius: 16,
    alignItems: 'center',
  },
  retryButtonText: {
    fontSize: 18,
    fontWeight: '700',
    color: '#FFFFFF',
  },
});
