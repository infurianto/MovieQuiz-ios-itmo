//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by infurianto on 26.01.2024.
//

protocol StatisticService {
    func store(correct count: Int, total amount: Int)
    var totalAccuracy: Double { get }
    var gamesCount: Int { get }
    var bestGame: GameRecord { get }
}
