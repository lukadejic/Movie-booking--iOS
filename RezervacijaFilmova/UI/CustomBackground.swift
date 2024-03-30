//
//  CustomBackground.swift
//  RezervacijaFilmova
//
//  Created by MacBook on 3/10/24.
//

import SwiftUI

struct CustomBackground: View {
    
    @State var color: Color = Color(.purple)
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .frame(width: 300,height: 300)
            .foregroundColor(color)
    }
}

#Preview {
    CustomBackground()
}
