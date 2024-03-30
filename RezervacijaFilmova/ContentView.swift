
import SwiftUI

struct ContentView: View {
    @State var currentTab: Tab = .home

    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        
        NavigationView {
            VStack(spacing: 0) {
                TabView(selection: $currentTab) {
                    HomeView()
                        .tag(Tab.home)
                    
                    LocationView()
                        .tag(Tab.location)
                    
                    
                    Text("Category")
                        .tag(Tab.ticket)
                    
                    ProfileView()
                        .tag(Tab.profile)
                }
                
                CustomTabBar(currentTab: $currentTab)
            }
            .ignoresSafeArea(.keyboard)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
