import SwiftUI

struct SectionItem: Identifiable {
    let id = UUID()
    let title: String
}

struct HomeView: View {
    @State 
    var animate: Bool = false
    
    @State
    var isShowing = false
    
    @State
    private var searchText: String = ""
    
    @State
    private var selectedMovie: Movie?

    var gradient = [Color(.black),Color(.purple)]
    
    @ObservedObject
    var viewModel = HomeViewModel()
    
    let sectionItems: [SectionItem] = [.init(title: "Trenutno se emituje"), .init(title: "Uskoro"), .init(title: "Najgledaniji filmovi"), .init(title: "Sa nagradom")]

    var body: some View {
        NavigationView {
            ZStack {
                CustomBackground(color: Color(.purple))
                    .blur(radius: animate ? 30 : 100)
                    .offset(x: animate ? -50: -130, y: animate ? -30 : 100)
                    .task {
                        withAnimation(.easeInOut(duration: 7).repeatForever()) {
                            animate.toggle()
                        }
                    }
                CustomBackground(color: Color(.brown))
                    .blur(radius: animate ? 30 : 100)
                    .offset(x: animate ? 100: 130, y: animate ? 150 : 100)
                    .task {
                        withAnimation(.easeInOut(duration: 7).repeatForever()) {
                            animate.toggle()
                        }
                    }
                
                VStack {
                    Text("Izaberite film")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, 20)

                    CustomSearchBar(searchText: $searchText)
                        .padding(.bottom, 20)

                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            ForEach(sectionItems) { item in
//                                ScrollSection1(title: item.title, isShowingDetail: $isShowing)
//                                    .padding(.bottom, 20)
                                ScrollSection1(viewModel: .init(title: item.title, movies: viewModel.movies))
                            }
//                            ScrollSection1(title: "Trenutno se emituje",isShowingDetail: $isShowing)
//                                .padding(.bottom, 20)
//                            ScrollSection2(title: "Uskoro", isShowingDetail: $isShowing)
//                                .padding(.bottom, 20)
//                            ScrollSection3(title: "Najgledaniji filmovi", isShowingDetail: $isShowing)
//                                .padding(.bottom, 20)
//                            ScrollSection4(title: "Sa nagradom", isShowingDetail: $isShowing)
//                                .padding(.bottom, 20)
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .background(LinearGradient(gradient: Gradient(colors: gradient), startPoint: .leading, endPoint: .trailing))
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .onChange(of: selectedMovie) { _ in
            isShowing = true
        }
        .onAppear {
            viewModel.loadMovies()
        }
        .sheet(isPresented: $isShowing) {
            if let selectedMovie = selectedMovie {
                BookingView(movie: selectedMovie)
                    .navigationBarHidden(true)
            }
        }
    }
}

#Preview {
    HomeView()
}
