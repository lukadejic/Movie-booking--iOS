//
//  ProfileView.swift
//  RezervacijaFilmova
//
//  Created by MacBook on 3/10/24.
//

import SwiftUI

struct ProfileView: View {
    @State var animate: Bool = false
    @State var firstName = ""
    @State var lastName = ""
    @State var password = ""
    @State var email = ""
    @State var date = Date()
    var gradient = [Color(.black),Color(.purple)]
    
    @StateObject var viewModel = ProfileViewModel()
    @FocusState var focusedTextField : FormTextField?
    
    enum FormTextField{
        case firstName, lastName, email, password
    }
    
    var body: some View {
        
        NavigationView {
            ZStack {
                    CustomBackground(color: Color(.purple))
                        .blur(radius: animate ? 30 : 100)
                        .offset(x: animate ? -50: -130, y: animate ? -30 : 100)
                        .task {
                            withAnimation(.easeInOut(duration: 7).repeatForever()){
                                animate.toggle()
                            }
                        }
                    
                    CustomBackground(color: Color(.brown))
                        .blur(radius: animate ? 30 : 100)
                        .offset(x: animate ? 100: 130, y: animate ? 150 : 100)
                        .task {
                            withAnimation(.easeInOut(duration: 7).repeatForever()){
                                animate.toggle()
                            }
                        }
                    VStack {
                        HStack{
                            Text("Account")
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.bold)
                            
                            
                        }
                        Form{
                            
                            Section(header: Text("User Info").foregroundColor(.white)
                                .fontWeight(.semibold)) {
                                    TextField("First Name", text: $viewModel.user.firstName)
                                    .focused($focusedTextField, equals: .firstName)
                                    .onSubmit {focusedTextField = .lastName}
                                    .submitLabel(.next)
                                
                                    TextField("Last Name", text: $viewModel.user.lastName)
                                    .focused($focusedTextField, equals: .lastName)
                                    .onSubmit {focusedTextField = .email}
                                    .submitLabel(.next)
                                
                                    TextField("Password", text: $viewModel.user.password)
                                        .focused($focusedTextField, equals: .password)
                                    .onSubmit {focusedTextField = .email}
                                    .submitLabel(.next)
                                
                                    TextField("Email", text: $viewModel.user.email)
                                    .focused($focusedTextField, equals: .email)
                                    .onSubmit {focusedTextField = nil}
                                    .submitLabel(.next)
                                    .keyboardType(.emailAddress)
                                    .textInputAutocapitalization(.none)
                                    .autocorrectionDisabled()
                                
                                    DatePicker("Birthday", selection: $viewModel.user.date,displayedComponents: .date)
                                    
                                Button {
                                    viewModel.saveChanges()
                                }label : {
                                    Text("Save Changes")
                                        .frame(width: 250,alignment: .leading)
                                        .foregroundColor(.teal)
                                }
                                
                            }
                            
                        }
                        .scrollContentBackground(.hidden)
                    }
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: gradient), startPoint: .leading, endPoint: .trailing)
            )
        }  
        .onAppear{
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            
            Alert(title: alertItem.title, message: alertItem.message
                  ,dismissButton: alertItem.dismissButton)
            
        }
    }
}


#Preview {
    ProfileView()
}
