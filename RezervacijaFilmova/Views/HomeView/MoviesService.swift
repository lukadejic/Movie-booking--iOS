//
//  MoviesService.swift
//  RezervacijaFilmova
//
//  Created by MacBook on 3/30/24.
//

import Foundation
import UIKit

protocol MoviesServiceProtocol {
    func fetchMovies() -> [Movie]
}

class MoviesService: MoviesServiceProtocol {
    
    var movies: [Movie] = []
    
    func fetchMovies() -> [Movie]{
        
        guard let url = URL(string:"https://raw.githubusercontent.com/prust/wikipedia-movie-data/master/movies-2020s.json") else {
            fatalError("")
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data,  error == nil else {
                return
            }
            
            do{
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                DispatchQueue.main.async{
                    self?.movies = movies
                }
            }catch{
                print(error)
            }
        }
        task.resume()
        return movies
    }
}

