//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by infurianto on 23.01.2024.
//

import Foundation
import UIKit

struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    let buttonAction: (() -> Void)?
}
