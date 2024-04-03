
import SwiftUI

class ScrollSectionViewModel: ObservableObject {
    @Published
    var title: String
    let movies: [Movie]
    
    @Published
    var selectedMovie: Movie?
    
    init(title: String, movies: [Movie]) {
        self.title = title
        self.movies = movies
    }
}

struct ScrollSection: View {
    
    @State var movies: [Movie] = []
    @State
    var isShowingDetail = false
    
    @State 
    var selectedMovie: Movie?
    
    @ObservedObject
    var viewModel: ScrollSectionViewModel
    
    init(viewModel: ScrollSectionViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(viewModel.title)
                    .fontWeight(.bold)
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack (spacing: -10){
                        ForEach(viewModel.movies) { movie in
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
