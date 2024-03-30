//
//  ScrollSection4.swift
//  RezervacijaFilmova
//
//  Created by MacBook on 3/10/24.
//

import SwiftUI

struct ScrollSection4: View {
    @State var title: String = "Now Playing"
    @State var movies4: [Movie] = Movie.movies4
    @State var movies: [Movie] = []
    @Binding var isShowingDetail: Bool
    @State var selectedMovie: Movie?

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(title)
                    .fontWeight(.bold)
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack (spacing: -10){
                        ForEach(movies4) { movie in
                            NavigationLink(destination: BookingView(movie: movie), label: {
                                VStack(spacing: 20) {
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
                            })
                            .onTapGesture {
                                selectedMovie = movie
                                isShowingDetail = true
                            }
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $isShowingDetail) {
            if let selectedMovie = selectedMovie {
                BookingView(movie: selectedMovie)
            }
        }
    }
}
//#Preview {
//    ScrollSection1 (isShowingDetail: .constant(true))
//}
