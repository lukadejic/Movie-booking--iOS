//
//  HomeViewModel.swift
//  RezervacijaFilmova
//
//  Created by MacBook on 3/30/24.
//

import Foundation

protocol HomeViewModelProtocol {
    func loadMovies()
}

class HomeViewModel: HomeViewModelProtocol, ObservableObject {
    
    @Published
    var movies: [Movie] = []
    
    func loadMovies() {
        
        let movies = [Movie(title: "Inception", year: 2013, trailer: "https://www.google.rs", cast: ["Leonardo Di Caprio"], genres: ["action"], href: "", extract: "", thumbnail: "", thumbnailWidth: 3, thumbnailHeight: 3)]
        self.movies = movies
    }
}
