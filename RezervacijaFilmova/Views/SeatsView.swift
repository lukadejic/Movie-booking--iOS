//
//  SeatsView.swift
//  RezervacijaFilmova
//
//  Created by MacBook on 3/12/24.
//

import SwiftUI

struct SeatsView: View {
    @Environment(\.dismiss) var dissmiss
    @State var animate : Bool = false
    @State var showButton : Bool = false
    @State private var isNavigatingToHome: Bool = false
    @State private var showAlert1: Bool = false
    @State private var showAlert2: Bool = false

    var gradient = [Color(.black).opacity(0.8),Color(.purple)]
    var body: some View {
        VStack{
            HStack{
                Button{
                    dissmiss()
                }label: {
                    BackButton()
                }
                
                Spacer()
                
                Text("Izaberite Sediste")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal, -100)
                    .foregroundColor(.white)
                    .opacity(0.9)
                
                Spacer()
            }
            .padding(20)
            
            VStack(spacing: 20){
  
                Image("seats")
                    .frame(height: 240)
                    .padding(.top, 60)
                    .padding(.horizontal, 20)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            showButton.toggle()
                        }
                    }
                
                
            }
            
            HStack(spacing: 20){
                StatusUI()
                
                StatusUI(color: Color(.magenta), text: "Reserved")

                StatusUI(color: Color(.cyan), text: "Selected")
            }
            .padding(.top, 30)
            
            
            ZStack{
                
                Circle()
                    .frame(width: 200, height: 230)
                    .foregroundColor(Color("purple"))
                    .blur(radius: animate ? 70 : 100)
                    .offset(x: animate ? -100 : 20, y: animate ? -20 : 20)
                    .task {
                        withAnimation(.easeInOut(duration: 7).repeatForever()) {
                            animate.toggle()
                        }
                    }

                Circle()
                    .frame(width: 200, height: 230)
                    .foregroundColor(Color("lightBlue"))
                    .blur(radius: animate ? 50 : 100)
                    .offset(x: animate ? 50 : 70, y: animate ? 70 : 30)
                    .task {
                        withAnimation(.easeInOut(duration: 4).repeatForever()) {
                            animate.toggle()
                        }
                    }

                Circle()
                    .frame(width: 200, height: 230)
                    .foregroundColor(Color("pink"))
                    .blur(radius: animate ? 70 : 100)
                    .offset(x: animate ? 150 : 170, y: animate ? 90 : 100)
                    .task {
                        withAnimation(.easeInOut(duration: 2).repeatForever()) {
                            animate.toggle()
                        }
                        
                    }
                
                VStack(alignment: .leading, spacing: 30.0) {
                    HStack(spacing: 10.0) {
                        Image(systemName: "calendar")
                        Text("April 28 , 2022")
                        Circle()
                            .frame(width: 6, height: 6)
                        Text("6 p.m.")
                    }
                    
                    HStack(spacing: 10.0) {
                        Image(systemName: "ticket.fill")
                        Text("VIP Section")
                        Circle()
                            .frame(width: 6, height: 6)
                        Text("Seat 9 ,10")
                    }
                    
                    HStack(spacing: 10.0) {
                        Image(systemName: "cart.fill")
                        Text("Total: $30")
                    }
                }
                .padding(.horizontal, -170)
                .padding(42)
                .font(.subheadline)

                HStack(){
                    NavigationLink(destination: HomeView(),isActive: $isNavigatingToHome){
                        EmptyView()
                    }
                    .isDetailLink(false)
                    
                    Button{
                        showAlert1 = true
                    }label: {
                        Spacer()
                        BuyButton()
                    }
                    .alert(isPresented: $showAlert1){
                        
                        Alert(
                            title: Text("Potvrda"),
                            message: Text("Uspesno ste rezervisali karte"),dismissButton: .default(Text("OK")){
                                isNavigatingToHome = true
                            }
                        )
                    }

                    
                }
                .padding(20)
                .frame(maxHeight: .infinity)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .clipped()
            .foregroundColor(.white)
            .background(.ultraThinMaterial)
            .padding(.top, 50)
            .offset(y: showButton ? 0 : 500)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors: gradient), startPoint: .top, endPoint: .bottom))
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SeatsView()
}
