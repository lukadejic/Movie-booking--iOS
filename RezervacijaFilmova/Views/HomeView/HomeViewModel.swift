
import Foundation
import SwiftUI

protocol HomeViewModelProtocol {
    func fetch()
}

struct SectionItem : Identifiable, Hashable{
    let id = UUID()
    let title: String
}

class HomeViewModel: HomeViewModelProtocol, ObservableObject {
            
    @Published
    var movies: [Movie] = []
    
    
    @Published
    var sectionItems: [SectionItem] = [.init(title: "Trenutno se emituje"), .init(title: "Uskoro"), .init(title: "Najgledaniji filmovi"), .init(title: "Sa nagradom")]
        
    @Published
    var animate: Bool = false
    
    @Published
    var isShowing = false
    
    @Published
    var searchText: String = ""
    
    @Published
    var selectedMovie: Movie?

//    @Published
    var moviesList : [[Movie]] = [Movie.movies1, Movie.movies2, Movie.movies3, Movie.movies4]
//
    var gradient = [Color(.black),Color(.purple)]
    
    private var service: MoviesServiceProtocol
    
    init(service: MoviesServiceProtocol) {
        self.service = service
    }
    
    func fetch() {
        guard let url = URL(string: "https://raw.githubusercontent.com/prust/wikipedia-movie-data/master/movies-2020s.json") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            
            guard let data = data, error == nil else {
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
    }
    
}

