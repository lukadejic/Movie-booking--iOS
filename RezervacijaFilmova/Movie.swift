import UIKit
import Foundation
import SwiftUI

struct Movie: Codable, Identifiable , Equatable{
    let id = UUID()
    let title: String
    let year: Int
    let trailer: String
    let cast, genres: [String]
    let href, extract: String
    let thumbnail: String
    let thumbnailWidth, thumbnailHeight: Int

    enum CodingKeys: String, CodingKey {
        case title, year, cast, genres, href, extract, thumbnail, trailer
        case thumbnailWidth = "thumbnail_width"
        case thumbnailHeight = "thumbnail_height"
    }

    static let allMovies : [Movie] = Bundle.main.decode(file: "MoviesAPI.json")
    static let sampleMovie :Movie = allMovies[0]
    
    static let movies1 : [Movie] = [allMovies[0], allMovies[1],allMovies[2],allMovies[3],allMovies[4]]
    
    static let movies2 : [Movie] = [allMovies[5], allMovies[6],allMovies[7],allMovies[8],allMovies[9]]
    
    static let movies3 : [Movie] = [allMovies[10], allMovies[11],allMovies[12],allMovies[13],allMovies[14]]
    
    static let movies4 : [Movie] = [allMovies[15], allMovies[16],allMovies[17],allMovies[18],allMovies[19]]
}

struct MovieResponse: Decodable {
    let request : [Movie]
}

extension Bundle{
    func decode<T: Decodable>(file: String) -> T{
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in the project")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) in the project")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) in the project")
        }
        
        return loadedData
        
    }
}

final class JSONManager {
    
    static let shared = JSONManager()
    private let cache = NSCache < NSString, UIImage >()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let movieURL = baseURL + "appetizers"
    
    private init() {}

    
    func getMovies() async throws -> [Movie]{
        
        guard let url = URL(string: movieURL) else {
            fatalError("Invalid url")
        }
        
        let (data,_) = try await URLSession.shared.data(from: url)
        
        do{
            let decoder = JSONDecoder()
            return try decoder.decode(MovieResponse.self, from: data).request
        }catch{
            fatalError("Invalid url")
        }
        
    }
   
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void){
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey){
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else{
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response,error in
            
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
