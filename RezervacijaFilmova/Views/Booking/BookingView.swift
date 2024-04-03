import SwiftUI

struct BookingView: View {
    @Environment(\.dismiss) var dissmiss
    let movie: Movie
    
    @ObservedObject
    var viewModel = BookingViewModel()
    
    
    var gradient = [Color(.black).opacity(0.7), Color(.purple)]

    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    HStack {
                        Button {
                            withAnimation(.spring) {
                                dissmiss()
                            }
                        } label: {
                            BackButton()
                        }
                        Spacer()
                       
                    }
                    .padding()

                    MovieRemoteImage(urlString: movie.thumbnail)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 225)
                        

                    Text(movie.title)
                        .foregroundColor(.white)
                        .font(.title2)
                        .fontWeight(.bold)
                        .opacity(0.6)
                        .italic()
                        .padding(.bottom, 10)
                    VStack{
                        HStack{
                            Text("Izaberite vreme")
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            NavigationLink{
                                VideoPlayerView(movie: movie, movieTrailer: movie.trailer)
                            }label: {
                                Label("Trailer", systemImage: "arrow.forward")
                                    .frame(width: 100,height: 20)
                                    .background(RoundedRectangle(cornerRadius: 20, style: .continuous)
                                        .fill(.purple).opacity(0.6))
                                    .overlay(Label("Trailer", systemImage: "arrow.forward")
                                        .foregroundColor(.white))
                                    
                            }
                        }
                        .padding(.horizontal, 20)
                       
                        HStack {
                            ForEach(viewModel.dates.indices, id: \.self) { index in
                                DateButton(
                                    weekDay: viewModel.dates[index].weekDay,
                                    numDay: viewModel.dates[index].numDay,
                                    width: viewModel.dates[index].width,
                                    height: viewModel.dates[index].height,
                                    isSelected: $viewModel.dates[index].isSelected,
                                    action: {
                                        viewModel.toggleDateSelection(index: index)
                                    }
                                )
                            }
                        }
                      
                        
                        HStack{
                            TimeButton(hour: "17:00", width: 50, height: 50, isSelected: $viewModel.isSelectedTime1,action: {
                                withAnimation {
                                    viewModel.isSelectedTime1.toggle()
                                }
                            })
                            
                            TimeButton(hour: "18:00", width: 50, height: 50, isSelected: $viewModel.isSelectedTime2,action: {
                                withAnimation{
                                    viewModel.isSelectedTime2.toggle()
                                }
                            })
                            
                            TimeButton(hour: "19:00", width: 50, height: 50, isSelected: $viewModel.isSelectedTime3,action: {
                                withAnimation{
                                    viewModel.isSelectedTime3.toggle()
                                }
                            })

                            TimeButton(hour: "20:00", width: 50, height: 50, isSelected: $viewModel.isSelectedTime4,action: {
                                withAnimation{
                                    viewModel.isSelectedTime4.toggle()
                                }
                            })

                            TimeButton(hour: "21:00", width: 50, height: 50, isSelected: $viewModel.isSelectedTime5,action: {
                                withAnimation{
                                    viewModel.isSelectedTime5.toggle()
                                }
                            })

                        }
                        
                    }

                    Spacer()
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Igraju:")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .opacity(0.6)
                                .italic()

                            ForEach(movie.cast, id: \.self) { text in
                                Text(text)
                            }
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Zanrovi")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .opacity(0.6)
                                .italic()

                            ForEach(movie.genres, id: \.self) { text in
                                Text(text)
                            }
                        }
                    }
                    .foregroundColor(.white)
                    .padding(20)

                    
                    NavigationLink {
                        SeatsView()
                    } label: {
                        CustomButton()
                            .frame(height: 50)
                            .offset(y: (viewModel.isSelectedTime1 || viewModel.isSelectedTime2 || viewModel.isSelectedTime3 || viewModel.isSelectedTime4 || viewModel.isSelectedTime5 ) && ( viewModel.isSelectedDate1 || viewModel.isSelectedDate2 || viewModel.isSelectedDate3 || viewModel.isSelectedDate4 || viewModel.isSelectedDate5  ) ? 0 : 200)
                        
                    }
      
                }
                .frame(maxHeight: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(
                            LinearGradient(gradient: Gradient(colors: gradient), startPoint: .top, endPoint: .bottom)
                        )
                )
                .padding(20)
                .shadow(color: .black, radius: 20, x: 0, y: 10)
            }
            .background(
                LinearGradient(gradient: Gradient(colors: gradient), startPoint: .leading, endPoint: .trailing)
                    .ignoresSafeArea()
                    .blur(radius: 20)
            )
            .ignoresSafeArea()
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct BookingView_Preview: PreviewProvider {
    static var previews: some View {
        BookingView(movie: Movie.sampleMovie)
    }
}
