import React, { createContext, useState, useContext, useEffect } from 'react';
import AsyncStorage from '@react-native-async-storage/async-storage';

const AppContext = createContext();

export const useApp = () => {
  const context = useContext(AppContext);
  if (!context) {
    throw new Error('useApp must be used within AppProvider');
  }
  return context;
};

export const AppProvider = ({ children }) => {
  const [user, setUser] = useState({
    name: 'Fara',
    nativeLanguage: null,
    learningLanguage: null,
    totalXP: 0,
    level: 1,
    currentStreak: 4,
    longestStreak: 10,
    hearts: 10,
    completedLessons: [],
    lessonScores: {},
    achievements: [],
    dailyProgress: {
      Mon: true,
      Tue: true,
      Wed: true,
      Thu: true,
      Fri: false,
      Sat: false
    }
  });

  const [currentLesson, setCurrentLesson] = useState(null);

  // Load user data from storage
  useEffect(() => {
    loadUserData();
  }, []);

  const loadUserData = async () => {
    try {
      const userData = await AsyncStorage.getItem('@user_data');
      if (userData) {
        setUser(JSON.parse(userData));
      }
    } catch (error) {
      console.error('Error loading user data:', error);
    }
  };

  const saveUserData = async (newUserData) => {
    try {
      await AsyncStorage.setItem('@user_data', JSON.stringify(newUserData));
      setUser(newUserData);
    } catch (error) {
      console.error('Error saving user data:', error);
    }
  };

  const setLanguages = (native, learning) => {
    const newUser = { ...user, nativeLanguage: native, learningLanguage: learning };
    saveUserData(newUser);
  };

  const completeLesson = (lessonId, score) => {
    const newUser = {
      ...user,
      completedLessons: [...new Set([...user.completedLessons, lessonId])],
      lessonScores: { ...user.lessonScores, [lessonId]: Math.max(user.lessonScores[lessonId] || 0, score) },
      totalXP: user.totalXP + Math.floor(score * 10)
    };
    saveUserData(newUser);
  };

  const updateDailyProgress = (day) => {
    const newUser = {
      ...user,
      dailyProgress: { ...user.dailyProgress, [day]: true }
    };
    saveUserData(newUser);
  };

  const loseHeart = () => {
    if (user.hearts > 0) {
      const newUser = { ...user, hearts: user.hearts - 1 };
      saveUserData(newUser);
      return true;
    }
    return false;
  };

  const resetHearts = () => {
    const newUser = { ...user, hearts: 10 };
    saveUserData(newUser);
  };

  const value = {
    user,
    setUser: saveUserData,
    setLanguages,
    completeLesson,
    updateDailyProgress,
    loseHeart,
    resetHearts,
    currentLesson,
    setCurrentLesson
  };

  return <AppContext.Provider value={value}>{children}</AppContext.Provider>;
};
