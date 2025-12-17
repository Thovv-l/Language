import React from 'react';
import {
  View,
  Text,
  ScrollView,
  TouchableOpacity,
  StyleSheet,
  SafeAreaView,
  StatusBar,
  Image
} from 'react-native';
import { LinearGradient } from 'expo-linear-gradient';
import { useApp } from '../contexts/AppContext';
import { getLessons, languages } from '../data/lessonContent';

export default function HomeScreen({ navigation }) {
  const { user } = useApp();

  const lessons = user.nativeLanguage && user.learningLanguage
    ? getLessons(user.nativeLanguage, user.learningLanguage)
    : [];

  const getDayAbbrev = (day) => {
    const days = { Mon: 'Mon', Tue: 'Tue', Wed: 'Wed', Thu: 'Thu', Fri: 'Fri', Sat: 'Sat' };
    return days[day] || day;
  };

  if (!user.nativeLanguage || !user.learningLanguage) {
    return (
      <SafeAreaView style={styles.container}>
        <Text style={styles.title}>Please select your languages first</Text>
      </SafeAreaView>
    );
  }

  const currentLang = languages[user.learningLanguage];

  return (
    <SafeAreaView style={styles.container}>
      <StatusBar barStyle="dark-content" />
      <ScrollView style={styles.scrollView} showsVerticalScrollIndicator={false}>
        {/* Header */}
        <View style={styles.header}>
          <View style={styles.headerLeft}>
            <View style={styles.avatar}>
              <Text style={styles.avatarText}>👩</Text>
            </View>
            <Text style={styles.greeting}>Hello {user.name}!</Text>
          </View>
          <View style={styles.languageSelector}>
            <Text style={styles.languageFlag}>{currentLang?.flag}</Text>
            <Text style={styles.languageName}>{currentLang?.fullName}</Text>
          </View>
        </View>

        {/* Learning Progress Card */}
        <View style={styles.progressCard}>
          <LinearGradient
            colors={['#22C55E', '#16A34A']}
            style={styles.progressGradient}
            start={{ x: 0, y: 0 }}
            end={{ x: 1, y: 1 }}
          >
            <Text style={styles.progressTitle}>Learning Progress</Text>

            {/* Daily Progress */}
            <View style={styles.dailyProgress}>
              {Object.keys(user.dailyProgress).map((day) => (
                <View key={day} style={styles.dayContainer}>
                  <View style={[
                    styles.dayCircle,
                    user.dailyProgress[day] && styles.dayCircleCompleted
                  ]}>
                    {user.dailyProgress[day] && (
                      <Text style={styles.checkmark}>✓</Text>
                    )}
                  </View>
                  <Text style={styles.dayLabel}>{getDayAbbrev(day)}</Text>
                </View>
              ))}
            </View>

            {/* Language Info */}
            <View style={styles.currentLanguageRow}>
              <View style={styles.currentLanguageInfo}>
                <Text style={styles.currentLanguageFlag}>{currentLang?.flag}</Text>
                <View>
                  <Text style={styles.currentLanguageText}>{currentLang?.fullName}</Text>
                  <Text style={styles.lessonCountText}>6/12 Lesson</Text>
                </View>
              </View>
              <TouchableOpacity style={styles.continueButton}>
                <Text style={styles.continueButtonText}>Continue</Text>
              </TouchableOpacity>
            </View>
          </LinearGradient>
        </View>

        {/* Search Bar */}
        <View style={styles.searchContainer}>
          <Text style={styles.searchIcon}>🔍</Text>
          <Text style={styles.searchPlaceholder}>Search Lesson...</Text>
        </View>

        {/* Featured Lessons */}
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Featured Lesson</Text>
          <ScrollView horizontal showsHorizontalScrollIndicator={false} style={styles.featuredScroll}>
            <View style={[styles.featuredCard, { backgroundColor: '#F97316' }]}>
              <Text style={styles.featuredTitle}>Grammar{'\n'}Boost</Text>
              <Text style={styles.featuredEmoji}>📖</Text>
              <TouchableOpacity style={styles.heartIcon}>
                <Text>🤍</Text>
              </TouchableOpacity>
            </View>
            <View style={[styles.featuredCard, { backgroundColor: '#8B5CF6' }]}>
              <Text style={styles.featuredTitle}>Word{'\n'}Mastery</Text>
              <Text style={styles.featuredEmoji}>🏆</Text>
              <TouchableOpacity style={styles.heartIcon}>
                <Text>🤍</Text>
              </TouchableOpacity>
            </View>
            <View style={[styles.featuredCard, { backgroundColor: '#EC4899' }]}>
              <Text style={styles.featuredTitle}>Practice{'\n'}Daily</Text>
              <Text style={styles.featuredEmoji}>🎯</Text>
              <TouchableOpacity style={styles.heartIcon}>
                <Text>🤍</Text>
              </TouchableOpacity>
            </View>
          </ScrollView>
        </View>

        {/* All Lessons */}
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>All Lesson</Text>
          <View style={styles.allLessonsGrid}>
            <TouchableOpacity style={styles.smallLessonCard}>
              <Text style={styles.smallLessonEmoji}>🌱</Text>
              <Text style={styles.smallLessonTitle}>Beginner Essentials</Text>
              <Text style={styles.smallLessonSubtitle}>Learn basic vocabulary and...</Text>
            </TouchableOpacity>
            <TouchableOpacity style={styles.smallLessonCard}>
              <Text style={styles.smallLessonEmoji}>🎓</Text>
              <Text style={styles.smallLessonTitle}>Intermediate Mastery</Text>
              <Text style={styles.smallLessonSubtitle}>Expanding vocabulary and...</Text>
            </TouchableOpacity>
          </View>
        </View>

        {/* Quiz and Test Section */}
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Quiz and Test</Text>

          {lessons.slice(0, 3).map((lesson, index) => (
            <TouchableOpacity
              key={lesson.id}
              style={styles.quizCard}
              onPress={() => navigation.navigate('Quiz', { lesson })}
            >
              <LinearGradient
                colors={[lesson.color, lesson.color + 'DD']}
                style={styles.quizGradient}
                start={{ x: 0, y: 0 }}
                end={{ x: 1, y: 0 }}
              >
                <View style={styles.quizContent}>
                  <View style={styles.quizLeft}>
                    <View style={styles.quizIconContainer}>
                      <Text style={styles.quizIcon}>{lesson.icon}</Text>
                    </View>
                    <View style={styles.quizInfo}>
                      <Text style={styles.quizLabel}>Quiz</Text>
                      <Text style={styles.quizTitle}>{lesson.title}</Text>
                      <View style={styles.quizMeta}>
                        <View style={styles.metaChip}>
                          <Text style={styles.metaText}>{lesson.estimatedMinutes} minutes</Text>
                        </View>
                        <View style={styles.metaChip}>
                          <Text style={styles.metaText}>{lesson.totalQuestions} questions</Text>
                        </View>
                      </View>
                      <View style={styles.progressBar}>
                        <View style={styles.progressBarBg}>
                          <View style={[styles.progressBarFill, { width: `${lesson.completionPercentage}%` }]} />
                        </View>
                        <Text style={styles.progressText}>
                          Lesson {lesson.lessonNumber}
                        </Text>
                        <Text style={styles.progressPercent}>
                          {lesson.completionPercentage}% Completed
                        </Text>
                      </View>
                    </View>
                  </View>
                  <View style={styles.quizRight}>
                    <View style={styles.scoreBox}>
                      <Text style={styles.scoreNumber}>
                        {user.lessonScores[lesson.id] || 0}/10
                      </Text>
                      <Text style={styles.scoreLabel}>Your Score</Text>
                    </View>
                  </View>
                </View>
              </LinearGradient>
            </TouchableOpacity>
          ))}
        </View>

        <View style={{ height: 100 }} />
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#FFFFFF',
  },
  scrollView: {
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
  headerLeft: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  avatar: {
    width: 40,
    height: 40,
    borderRadius: 20,
    backgroundColor: '#F3F4F6',
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 12,
  },
  avatarText: {
    fontSize: 24,
  },
  greeting: {
    fontSize: 20,
    fontWeight: '600',
    color: '#111827',
  },
  languageSelector: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#F9FAFB',
    paddingHorizontal: 12,
    paddingVertical: 6,
    borderRadius: 20,
  },
  languageFlag: {
    fontSize: 18,
    marginRight: 6,
  },
  languageName: {
    fontSize: 13,
    fontWeight: '500',
    color: '#374151',
    marginRight: 4,
  },
  progressCard: {
    marginHorizontal: 20,
    marginBottom: 20,
    borderRadius: 24,
    overflow: 'hidden',
    elevation: 4,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 8,
  },
  progressGradient: {
    padding: 20,
  },
  progressTitle: {
    fontSize: 18,
    fontWeight: '600',
    color: '#FFFFFF',
    marginBottom: 16,
  },
  dailyProgress: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: 20,
  },
  dayContainer: {
    alignItems: 'center',
  },
  dayCircle: {
    width: 36,
    height: 36,
    borderRadius: 18,
    backgroundColor: 'rgba(255, 255, 255, 0.3)',
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: 6,
  },
  dayCircleCompleted: {
    backgroundColor: '#FFFFFF',
  },
  checkmark: {
    color: '#22C55E',
    fontSize: 18,
    fontWeight: '700',
  },
  dayLabel: {
    fontSize: 11,
    color: '#FFFFFF',
    fontWeight: '500',
  },
  currentLanguageRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  currentLanguageInfo: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  currentLanguageFlag: {
    fontSize: 32,
    marginRight: 12,
  },
  currentLanguageText: {
    fontSize: 14,
    fontWeight: '600',
    color: '#FFFFFF',
  },
  lessonCountText: {
    fontSize: 12,
    color: 'rgba(255, 255, 255, 0.8)',
    marginTop: 2,
  },
  continueButton: {
    backgroundColor: '#111827',
    paddingHorizontal: 24,
    paddingVertical: 12,
    borderRadius: 20,
  },
  continueButtonText: {
    color: '#FFFFFF',
    fontSize: 14,
    fontWeight: '600',
  },
  searchContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#F9FAFB',
    marginHorizontal: 20,
    paddingHorizontal: 16,
    paddingVertical: 14,
    borderRadius: 12,
    marginBottom: 24,
  },
  searchIcon: {
    fontSize: 18,
    marginRight: 8,
  },
  searchPlaceholder: {
    fontSize: 15,
    color: '#9CA3AF',
  },
  section: {
    marginBottom: 24,
  },
  sectionTitle: {
    fontSize: 18,
    fontWeight: '600',
    color: '#111827',
    paddingHorizontal: 20,
    marginBottom: 16,
  },
  featuredScroll: {
    paddingLeft: 20,
  },
  featuredCard: {
    width: 140,
    height: 160,
    borderRadius: 20,
    padding: 16,
    marginRight: 12,
    justifyContent: 'space-between',
  },
  featuredTitle: {
    fontSize: 16,
    fontWeight: '600',
    color: '#FFFFFF',
    lineHeight: 22,
  },
  featuredEmoji: {
    fontSize: 36,
    alignSelf: 'flex-end',
  },
  heartIcon: {
    position: 'absolute',
    top: 12,
    right: 12,
  },
  allLessonsGrid: {
    flexDirection: 'row',
    paddingHorizontal: 20,
    gap: 12,
  },
  smallLessonCard: {
    flex: 1,
    backgroundColor: '#F9FAFB',
    borderRadius: 16,
    padding: 16,
    minHeight: 140,
  },
  smallLessonEmoji: {
    fontSize: 32,
    marginBottom: 8,
  },
  smallLessonTitle: {
    fontSize: 14,
    fontWeight: '600',
    color: '#111827',
    marginBottom: 4,
  },
  smallLessonSubtitle: {
    fontSize: 12,
    color: '#6B7280',
    lineHeight: 16,
  },
  quizCard: {
    marginHorizontal: 20,
    marginBottom: 16,
    borderRadius: 20,
    overflow: 'hidden',
    elevation: 4,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.15,
    shadowRadius: 8,
  },
  quizGradient: {
    padding: 16,
  },
  quizContent: {
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  quizLeft: {
    flexDirection: 'row',
    flex: 1,
  },
  quizIconContainer: {
    width: 48,
    height: 48,
    borderRadius: 12,
    backgroundColor: 'rgba(0, 0, 0, 0.1)',
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 12,
  },
  quizIcon: {
    fontSize: 24,
  },
  quizInfo: {
    flex: 1,
  },
  quizLabel: {
    fontSize: 12,
    color: 'rgba(255, 255, 255, 0.9)',
    marginBottom: 4,
  },
  quizTitle: {
    fontSize: 16,
    fontWeight: '700',
    color: '#FFFFFF',
    marginBottom: 8,
  },
  quizMeta: {
    flexDirection: 'row',
    marginBottom: 12,
  },
  metaChip: {
    backgroundColor: 'rgba(255, 255, 255, 0.25)',
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 12,
    marginRight: 8,
  },
  metaText: {
    fontSize: 11,
    color: '#FFFFFF',
    fontWeight: '500',
  },
  progressBar: {
    marginTop: 4,
  },
  progressBarBg: {
    height: 4,
    backgroundColor: 'rgba(255, 255, 255, 0.3)',
    borderRadius: 2,
    marginBottom: 6,
  },
  progressBarFill: {
    height: 4,
    backgroundColor: '#FFFFFF',
    borderRadius: 2,
  },
  progressText: {
    fontSize: 11,
    color: 'rgba(255, 255, 255, 0.9)',
    marginBottom: 2,
  },
  progressPercent: {
    fontSize: 11,
    color: 'rgba(255, 255, 255, 0.9)',
  },
  quizRight: {
    justifyContent: 'center',
    alignItems: 'center',
  },
  scoreBox: {
    backgroundColor: '#FFFFFF',
    borderRadius: 16,
    padding: 16,
    alignItems: 'center',
    minWidth: 80,
  },
  scoreNumber: {
    fontSize: 24,
    fontWeight: '700',
    color: '#111827',
    marginBottom: 4,
  },
  scoreLabel: {
    fontSize: 11,
    color: '#6B7280',
  },
});
