//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by infurianto on 23.01.2024.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
}
