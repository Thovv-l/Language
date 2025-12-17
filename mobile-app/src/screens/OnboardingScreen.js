import React, { useState } from 'react';
import {
  View,
  Text,
  TouchableOpacity,
  StyleSheet,
  SafeAreaView,
  StatusBar,
  ScrollView
} from 'react-native';
import { LinearGradient } from 'expo-linear-gradient';
import { useApp } from '../contexts/AppContext';
import { languages } from '../data/lessonContent';

export default function OnboardingScreen({ navigation }) {
  const { setLanguages } = useApp();
  const [step, setStep] = useState(0);
  const [nativeLanguage, setNativeLanguage] = useState(null);
  const [learningLanguage, setLearningLanguage] = useState(null);

  const languageCodes = Object.keys(languages);

  const handleContinue = () => {
    if (step === 0) {
      setStep(1);
    } else if (step === 1) {
      setStep(2);
    } else {
      setLanguages(nativeLanguage, learningLanguage);
      navigation.replace('Main');
    }
  };

  const canContinue = () => {
    if (step === 0) return true;
    if (step === 1) return nativeLanguage !== null;
    if (step === 2) return learningLanguage !== null;
    return false;
  };

  return (
    <SafeAreaView style={styles.container}>
      <StatusBar barStyle="light-content" />

      <LinearGradient
        colors={['#22C55E', '#16A34A']}
        style={styles.gradient}
      >
        {step === 0 && (
          <View style={styles.welcomeContainer}>
            <Text style={styles.emoji}>🌍</Text>
            <Text style={styles.welcomeTitle}>Welcome to Language Learning</Text>
            <Text style={styles.welcomeSubtitle}>
              Learn real-world phrases{'\n'}that you'll actually use
            </Text>

            <TouchableOpacity style={styles.button} onPress={handleContinue}>
              <Text style={styles.buttonText}>Get Started</Text>
            </TouchableOpacity>
          </View>
        )}

        {step === 1 && (
          <View style={styles.selectionContainer}>
            <Text style={styles.selectionTitle}>What's your native language?</Text>
            <Text style={styles.selectionSubtitle}>We'll use this to teach you</Text>

            <ScrollView style={styles.languageList} showsVerticalScrollIndicator={false}>
              {languageCodes.map((code) => (
                <TouchableOpacity
                  key={code}
                  style={[
                    styles.languageOption,
                    nativeLanguage === code && styles.languageOptionSelected
                  ]}
                  onPress={() => setNativeLanguage(code)}
                >
                  <Text style={styles.languageFlag}>{languages[code].flag}</Text>
                  <Text style={styles.languageName}>{languages[code].fullName}</Text>
                  {nativeLanguage === code && (
                    <Text style={styles.checkmark}>✓</Text>
                  )}
                </TouchableOpacity>
              ))}
            </ScrollView>

            <TouchableOpacity
              style={[styles.button, !canContinue() && styles.buttonDisabled]}
              onPress={handleContinue}
              disabled={!canContinue()}
            >
              <Text style={styles.buttonText}>Continue</Text>
            </TouchableOpacity>
          </View>
        )}

        {step === 2 && (
          <View style={styles.selectionContainer}>
            <Text style={styles.selectionTitle}>What do you want to learn?</Text>
            <Text style={styles.selectionSubtitle}>Choose your target language</Text>

            <ScrollView style={styles.languageList} showsVerticalScrollIndicator={false}>
              {languageCodes
                .filter((code) => code !== nativeLanguage)
                .map((code) => (
                  <TouchableOpacity
                    key={code}
                    style={[
                      styles.languageOption,
                      learningLanguage === code && styles.languageOptionSelected
                    ]}
                    onPress={() => setLearningLanguage(code)}
                  >
                    <Text style={styles.languageFlag}>{languages[code].flag}</Text>
                    <Text style={styles.languageName}>{languages[code].fullName}</Text>
                    {learningLanguage === code && (
                      <Text style={styles.checkmark}>✓</Text>
                    )}
                  </TouchableOpacity>
                ))}
            </ScrollView>

            <TouchableOpacity
              style={[styles.button, !canContinue() && styles.buttonDisabled]}
              onPress={handleContinue}
              disabled={!canContinue()}
            >
              <Text style={styles.buttonText}>Start Learning</Text>
            </TouchableOpacity>
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
  welcomeContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
  },
  emoji: {
    fontSize: 100,
    marginBottom: 32,
  },
  welcomeTitle: {
    fontSize: 34,
    fontWeight: '700',
    color: '#FFFFFF',
    textAlign: 'center',
    marginBottom: 16,
  },
  welcomeSubtitle: {
    fontSize: 18,
    color: 'rgba(255, 255, 255, 0.9)',
    textAlign: 'center',
    marginBottom: 48,
    lineHeight: 26,
  },
  selectionContainer: {
    flex: 1,
    padding: 20,
    paddingTop: 60,
  },
  selectionTitle: {
    fontSize: 28,
    fontWeight: '700',
    color: '#FFFFFF',
    textAlign: 'center',
    marginBottom: 12,
  },
  selectionSubtitle: {
    fontSize: 16,
    color: 'rgba(255, 255, 255, 0.9)',
    textAlign: 'center',
    marginBottom: 32,
  },
  languageList: {
    flex: 1,
    marginBottom: 20,
  },
  languageOption: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: 'rgba(255, 255, 255, 0.2)',
    padding: 16,
    borderRadius: 16,
    marginBottom: 12,
    borderWidth: 2,
    borderColor: 'transparent',
  },
  languageOptionSelected: {
    backgroundColor: 'rgba(255, 255, 255, 0.3)',
    borderColor: '#FFFFFF',
  },
  languageFlag: {
    fontSize: 32,
    marginRight: 16,
  },
  languageName: {
    flex: 1,
    fontSize: 18,
    fontWeight: '600',
    color: '#FFFFFF',
  },
  checkmark: {
    fontSize: 24,
    color: '#FFFFFF',
    fontWeight: '700',
  },
  button: {
    backgroundColor: '#FCD34D',
    paddingVertical: 16,
    borderRadius: 16,
    alignItems: 'center',
    width: '100%',
  },
  buttonDisabled: {
    backgroundColor: 'rgba(252, 211, 77, 0.5)',
  },
  buttonText: {
    fontSize: 18,
    fontWeight: '700',
    color: '#111827',
  },
});
