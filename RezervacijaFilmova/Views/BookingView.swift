import SwiftUI

struct BookingView: View {
    @Environment(\.dismiss) var dissmiss
    let movie: Movie
    
    @State var movies: [Movie] = []
    @State var isSelectedTime1 : Bool = false
    @State var isSelectedTime2 : Bool = false
    @State var isSelectedTime3 : Bool = false
    @State var isSelectedTime4 : Bool = false
    @State var isSelectedTime5 : Bool = false
    @State var isSelecetedDate1: Bool = false
    @State var isSelecetedDate2: Bool = false
    @State var isSelecetedDate3: Bool = false
    @State var isSelecetedDate4: Bool = false
    @State var isSelecetedDate5: Bool = false
    
    @State var isShowingTab: Bool = true
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
                       
                        HStack{
                            DateButton(weekDay: "Pon", numDay: "20", width: 50, height: 60, isSelected: $isSelecetedDate1, action: {
                                withAnimation(.spring()) {
                                    isSelecetedDate1.toggle()
                                }
                            })
                            
                            DateButton(weekDay: "Uto", numDay: "21", width: 50, height: 60, isSelected: $isSelecetedDate2, action: {
                                withAnimation(.spring()) {
                                    isSelecetedDate2.toggle()
                                }
                            })
                            
                            DateButton(weekDay: "Sre", numDay: "22", width: 50, height: 60, isSelected: $isSelecetedDate3, action: {
                                withAnimation(.spring()) {
                                    isSelecetedDate3.toggle()
                                }
                            })
                            
                            DateButton(weekDay: "Cet", numDay: "23", width: 50, height: 60, isSelected: $isSelecetedDate4, action: {
                                withAnimation(.spring()) {
                                    isSelecetedDate4.toggle()
                                }
                            })
                            
                            DateButton(weekDay: "Pet", numDay: "24", width: 50, height: 60, isSelected: $isSelecetedDate5, action: {
                                withAnimation(.spring()) {
                                    isSelecetedDate5.toggle()
                                }
                            })
                        }
                      
                        
                        HStack{
                            TimeButton(hour: "17:00", width: 50, height: 50, isSelected: $isSelectedTime1,action: {
                                withAnimation {
                                    isSelectedTime1.toggle()
                                }
                            })
                            
                            TimeButton(hour: "18:00", width: 50, height: 50, isSelected: $isSelectedTime2,action: {
                                withAnimation{
                                    isSelectedTime2.toggle()
                                }
                            })
                            
                            TimeButton(hour: "19:00", width: 50, height: 50, isSelected: $isSelectedTime3,action: {
                                withAnimation{
                                    isSelectedTime3.toggle()
                                }
                            })

                            TimeButton(hour: "20:00", width: 50, height: 50, isSelected: $isSelectedTime4,action: {
                                withAnimation{
                                    isSelectedTime4.toggle()
                                }
                            })

                            TimeButton(hour: "21:00", width: 50, height: 50, isSelected: $isSelectedTime5,action: {
                                withAnimation{
                                    isSelectedTime5.toggle()
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
                            .offset(y: (isSelectedTime1 || isSelectedTime2 || isSelectedTime3 || isSelectedTime4 || isSelectedTime5 ) && ( isSelecetedDate1 || isSelecetedDate2 || isSelecetedDate3 || isSelecetedDate4 || isSelecetedDate5  ) ? 0 : 200)
                        
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
