import SwiftUI

struct ScrollSection2: View {
    @State var title: String = "Now Playing"
    @State var movies2: [Movie] = Movie.movies2
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
                    HStack(spacing: -10) {
                        ForEach(movies2) { movie in
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
#Preview {
    ScrollSection2 (isShowingDetail: .constant(true))
}
