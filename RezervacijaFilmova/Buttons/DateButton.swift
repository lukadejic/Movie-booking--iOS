import SwiftUI

struct DateButton: View {
    @State var weekDay: String = "Sat"
    @State var numDay: String = "23"
    
    @State var width: CGFloat = 50
    @State var height: CGFloat = 80
    
    @Binding var isSelected: Bool
    @State var action: () -> Void = {}
    
    var currentBorderColors: [Color] = [Color(.blue), Color(.cyan).opacity(0), Color(.cyan).opacity(0)]
    //Nemoj da smaras xCode!!!
    var selectedBorderColors: [Color] = [Color(.black), Color(.red).opacity(0.7), Color(.red).opacity(0)]
    var selectedGradient: [Color] = [Color(.black).opacity(0.6), Color(.red)]
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Text(weekDay)
                
                Text(numDay)
                    .fontWeight(.bold)
            }
            .font(.subheadline)
            .foregroundColor(.white)
            .frame(width: width, height: height)
            .background(LinearGradient(colors: isSelected ? selectedGradient : [Color(.purple), Color(.red)], startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(LinearGradient(colors: isSelected ? selectedBorderColors : currentBorderColors, startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 2))
                    .frame(width: width - 1, height: height - 1)
            }
        }
    }
}

#Preview {
    DateButton(isSelected: .constant(true))
}
