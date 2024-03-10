//
//  QuestionFactory.swift
//  MovieQuiz
//
//  Created by infurianto on 22.01.2024.
//

import Foundation

final class QuestionFactory: QuestionFactoryProtocol {
    
    private let moviesLoader: MoviesLoading
    weak var delegate: QuestionFactoryDelegate?
    private var movies: [MostPopularMovie] = []

    init(moviesLoader: MoviesLoading, delegate: QuestionFactoryDelegate?) {
        self.moviesLoader = moviesLoader
        self.delegate = delegate
    }
    
    func loadData() {
        moviesLoader.loadMovies { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                switch result {
                case .success(let mostPopularMovies):
                    if mostPopularMovies.errorMessage != ""{
                                       self.delegate?.didFailToLoadData(with: NetworkError.apiKeyError)
                                   }

                    self.movies = mostPopularMovies.items
                    self.delegate?.didLoadDataFromServer()
                case .failure(let error):
                    self.delegate?.didFailToLoadData(with: error)
                }
            }
        }
    }
    
    func requestNextQuestion() {
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            let index = (0..<self.movies.count).randomElement() ?? 0
             
            guard let movie = self.movies[safe: index] else { return }
            
            var imageData = Data()
           
           do {
                imageData = try Data(contentsOf: movie.resizedImageURL)
            } catch {
                DispatchQueue.main.async{ [weak self] in
                      guard let self = self else { return }
                      self.delegate?.didFailToLoadData(with: NetworkError.imageError)
                  }
                  return
            }
            
            let rating = Float(movie.rating) ?? 0
            
            let randomRating = Float.random(in: 1...10)
            var text = String()
            var correctAnswer = Bool()
            
            if Bool.random(){
                text = "Рейтинг этого фильма больше чем \(Int(randomRating))?"
                correctAnswer = rating > randomRating
            } else{
                text = "Рейтинг этого фильма меньше чем \(Int(randomRating))?"
                correctAnswer = rating < randomRating
            }
            
            let question = QuizQuestion(image: imageData,
                                         text: text,
                                         correctAnswer: correctAnswer)
           // self.movies.remove(at: index)
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.delegate?.didReceiveNextQuestion(question: question)
            }
        }
    }
}
