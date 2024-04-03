//
//  MovieScrollCell.swift
//  RezervacijaFilmova
//
//  Created by MacBook on 3/11/24.
//

import SwiftUI

struct MovieScrollCell: View {
    
    let movie: Movie
    
    var body: some View {
        VStack(spacing: 20){
            MovieRemoteImage(urlString: movie.thumbnail)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 100)
                .cornerRadius(20)
            Text(movie.title)
                .foregroundColor(.white)
                .font(.subheadline)
                .opacity(0.6)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

//#Preview {
//    MovieScrollCell(movie: Movie.sampleMovie)
//}
