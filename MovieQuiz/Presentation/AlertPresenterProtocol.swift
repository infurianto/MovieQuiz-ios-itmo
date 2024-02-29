//
//  AlertPresenterProtocol.swift
//  MovieQuiz
//
//  Created by infurianto on 23.01.2024.
//

protocol AlertPresenterProtocol {
    var delegate: AlertPresenterDelegate? {get set}
    func showAlert(with model: AlertModel)
}
