//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by infurianto on 23.01.2024.
//

import Foundation
import UIKit

final class AlertPresenter: AlertPresenterProtocol {
    
    weak var delegate: AlertPresenterDelegate?
    
    func showAlert(with model: AlertModel) {
        let alert = UIAlertController(
            title: model.title,
            message: model.message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: model.buttonText,
            style: .default, 
            handler: { _ in
                model.buttonAction?()
            })
        
        alert.addAction(action)
        
        self.delegate?.show(alert: alert)
    }
    
}
