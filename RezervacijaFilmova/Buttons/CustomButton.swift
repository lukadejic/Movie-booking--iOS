import SwiftUI

struct CustomButton: View {
    var selectedBorderColors: [Color] = [Color(.red), Color(.red).opacity(0), Color(.red).opacity(0)]
    
    var body: some View {
        Text("Rezervisite")
            .font(.body)
            .fontWeight(.medium)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 60)
            .background(LinearGradient(colors: [Color(.red).opacity(0.8), Color(.purple).opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.7), radius: 20, x: 0, y: 10)
           
    }
}

struct LargeButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton()
    }
}
