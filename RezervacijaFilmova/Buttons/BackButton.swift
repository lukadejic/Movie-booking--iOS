//
//  BackButton.swift
//  RezervacijaFilmova
//
//  Created by MacBook on 3/12/24.
//

import SwiftUI

struct BackButton: View {
    var gradient = [Color(.purple),Color(.purple).opacity(0.7)]
    var body: some View {
        HStack(alignment: .center, spacing:20){
            Label("", systemImage: "arrow.backward")
                .offset(x: 5,y: -2)
                .foregroundColor(.white)
                .frame(width: 50,height: 36)
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(LinearGradient(gradient: Gradient(colors: gradient), startPoint: .leading, endPoint: .trailing))
                )
        }
     
    }
}

#Preview {
    BackButton()
}
