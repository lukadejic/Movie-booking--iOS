import SwiftUI
import WebKit

struct VideoPlayerView: View {
    @Environment(\.dismiss) var dissmiss
    let movie: Movie
    let movieTrailer: String
    var gradient = [Color(.black).opacity(0.8),Color(.purple)]
    
    var body: some View {
        ZStack{
            VStack{
                
                VideoPlayer(videoID: movieTrailer)
                    .frame(height: 400)
                    .frame(maxHeight: .infinity,alignment: .top)
                    .overlay(
                        HStack{
                            Button {
                                withAnimation(.spring) {
                                    dissmiss()
                                }
                            } label: {
                                BackButton()
                            }

                        }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            .padding(20)
                    )
                
                
                VStack (alignment: .leading){
                    Text("Opis:")
                        .font(.title)
                        .italic()
                    
                    Text(movie.extract)
                        .font(.subheadline)
                        .padding(.bottom,100)
                }
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                

            }
                      
        }
        .background(LinearGradient(gradient: Gradient(colors: gradient), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}



struct VideoPlayer: UIViewRepresentable {
    
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let videoURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else {
            return
        }
        let request = URLRequest(url: videoURL)
        uiView.load(request)
    }
}

//#Preview {
//    VideoPlayerView(movie: Movie.sampleMovie, movieTrailer:"O2NKzO-fxwQ")
//}
