//
//  QuestionFactoryProtocol.swift
//  MovieQuiz
//
//  Created by infurianto on 22.01.2024.
//

import Foundation

protocol QuestionFactoryProtocol {
    var delegate: QuestionFactoryDelegate? {get set}
    func loadData()
    func requestNextQuestion()
}
