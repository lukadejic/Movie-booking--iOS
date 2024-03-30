//
//  CustomChair.swift
//  RezervacijaFilmova
//
//  Created by MacBook on 3/14/24.
//

import SwiftUI

struct CustomChair: View {
    @Binding var isSelected:Bool
    @State var color: Color
    var body: some View {
        Image(systemName: "chair.fill")
            .imageScale(.large)
            .foregroundColor(isSelected ? Color(.purple) : Color("Majenta"))
            
    }
}

#Preview {
    CustomChair(isSelected: .constant(true), color: Color("Majenta"))
}
