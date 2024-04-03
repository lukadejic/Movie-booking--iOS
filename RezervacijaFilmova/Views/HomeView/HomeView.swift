import SwiftUI

struct HomeView: View {

    @ObservedObject
    var viewModel = HomeViewModel(service: MoviesService())
    
    var body: some View {
        NavigationView {
            ZStack {
                CustomBackground(color: Color(.purple))
                    .blur(radius: viewModel.animate ? 30 : 100)
                    .offset(x: viewModel.animate ? -50: -130, y: viewModel.animate ? -30 : 100)
                    .task {
                        withAnimation(.easeInOut(duration: 7).repeatForever()) {
                            viewModel.animate.toggle()
                        }
                    }
                CustomBackground(color: Color(.brown))
                    .blur(radius: viewModel.animate ? 30 : 100)
                    .offset(x: viewModel.animate ? 100: 130, y: viewModel.animate ? 150 : 100)
                    .task {
                        withAnimation(.easeInOut(duration: 7).repeatForever()) {
                            viewModel.animate.toggle()
                        }
                    }
                
                VStack {
                    Text("Izaberite film")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, 20)

                    CustomSearchBar(searchText: $viewModel.searchText)
                        .padding(.bottom, 20)

                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
//                            ForEach(Array(viewModel.sectionItems.enumerated()), id: \.element) { index, item in
//                                ScrollSection(
//                                    viewModel: ScrollSectionViewModel(
//                                        title: item.title, movies: viewModel.moviesList[index])
//                                )
//                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .background(LinearGradient(gradient: Gradient(colors: viewModel.gradient), startPoint: .leading, endPoint: .trailing))
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .onChange(of: viewModel.selectedMovie) {
            viewModel.isShowing = true
        }
        .task {
            viewModel.fetch()
        }
        .sheet(isPresented: $viewModel.isShowing) {
            if let selectedMovie = viewModel.selectedMovie {
                BookingView(movie: selectedMovie)
                    .navigationBarHidden(true)
            }
        }
    }
}

#Preview {
    HomeView()
}
