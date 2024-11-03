import SwiftUI

struct FeedView: View {
    
    @State private var videos = [Video]()
    @State private var selectedVideo: Video?
    
    var body: some View {
        List(videos) { v in
            VideoRowView(video: v)
                .onTapGesture(perform: {
                    selectedVideo = v
                })
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .padding(.horizontal)
        .scrollIndicators(.hidden)
        .task {
            self.videos = await DataService().getVideos()
        }
        .sheet(item: $selectedVideo) { v in
            VideoDetailView(video: v)
        }
    }
}

#Preview {
    FeedView()
}
