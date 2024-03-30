
import SwiftUI

struct CustomTabBar: View {
   
    @Binding var currentTab: Tab
    @State var isShowingTab : Bool = false
   

    var gradient = [Color(.purple),Color(.blue),Color(.red)]
    
    var rectangleGradient = [Color(.black).opacity(0.6), Color(.purple)]
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
           
                
                HStack(spacing: 0){
                    ForEach(Tab.allCases, id: \.rawValue) {tab in
                        Button {
                            withAnimation(.spring) {
                                currentTab = tab
                            }
                        }label: {
                            VStack{
                                Image(tab.rawValue)
                                    .renderingMode(.template)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.white)
                                    .offset(y: currentTab == tab ? -17: 0)
                            }
                            
                        }
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .background(alignment:.leading){
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(LinearGradient(gradient: Gradient(colors: rectangleGradient), startPoint: .leading, endPoint: .trailing))
                        .frame(width: 73, height: 60)
                        .shadow(color: .black.opacity(0.25), radius: 10, x: 0, y: 10)
                        .offset(x: indicatorOffset(width: width + 15), y: -17)
                        
                }
 
          
            
            if isShowingTab {
                CustomTabBar(currentTab: $currentTab)
                    padding(.bottom, 20)
                }
            
        }
        .frame(height: 24)
        .padding(.top,20)
        .background(.ultraThinMaterial)
        .background(LinearGradient(gradient: Gradient(colors: gradient), startPoint: .leading, endPoint: .trailing))
    }
    
    func indicatorOffset(width: CGFloat) -> CGFloat {
        let index = CGFloat(getIndex())
        if index == 0 { return 0 }
        
        let buttonWidth = width / CGFloat(Tab.allCases.count)
        
        return index * buttonWidth
    }
    
    
    
    func getIndex() -> Int {
        switch currentTab {
        case .home:
            return 0
        case .location:
            return 1
        case .ticket:
            return 2
        case .profile:
            return 3
        }
    }
}

#Preview {
    ContentView()
}


