//
//  BuyButton.swift
//  RezervacijaFilmova
//
//  Created by MacBook on 3/12/24.
//

import SwiftUI

struct BuyButton: View {
    var body: some View {
        Text("")
            .frame(width: 100,height: 60)
            .background(
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(.black), Color(.red).opacity(0.7)]), startPoint: .top, endPoint: .bottom))
            )        
            .overlay(Text("Kupite")
                .foregroundColor(.white)
                .font(.subheadline)
                .fontWeight(.semibold))
            
    }
}

#Preview {
    BuyButton()
}
