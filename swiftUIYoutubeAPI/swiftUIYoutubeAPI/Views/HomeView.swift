import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "play.square.stack")
                    Text("Feed")
                }
        }
        .ignoresSafeArea()

    }
}

#Preview {
    HomeView()
}




//        .onAppear(perform: {
//            print(Bundle.main.infoDictionary?["API_KEY"] as? String ?? "Cannot find")
//        })
