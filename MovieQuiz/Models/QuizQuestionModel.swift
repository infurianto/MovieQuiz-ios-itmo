//
//  QuizQuestion.swift
//  MovieQuiz
//
//  Created by infurianto on 22.01.2024.
//

// модель для вопроса
struct QuizQuestion {
  // строка с названием фильма,
  // совпадает с названием картинки афиши фильма в Assets
  let image: String
  // строка с вопросом о рейтинге фильма
  let text: String
  // булевое значение (true, false), правильный ответ на вопрос
  let correctAnswer: Bool
}

