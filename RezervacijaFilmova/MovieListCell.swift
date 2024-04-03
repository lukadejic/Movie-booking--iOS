//
//  MovieListCell.swift
//  RezervacijaFilmova
//
//  Created by MacBook on 3/9/24.
//

import SwiftUI

struct MovieListCell: View {
    let movie: Movie
    
    var body: some View {
        VStack{
            VStack(){}
            .frame(width: 200,height: 200)
            .background(
                MovieRemoteImage(urlString: movie.thumbnail)
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                    .cornerRadius(8)
                    .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 10)
            )
            Text(movie.title)
                .font(.title)
                .fontWeight(.medium)
                .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 10)
        }

        
    }
}

//#Preview {
//    MovieListCell(movie: Movie.sampleMovie)
//}
