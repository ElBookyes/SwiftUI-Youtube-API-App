import Foundation

struct DataService {
    
    private let API_KEY = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func getVideos() async -> [Video] {
        
        // Check if api key is there
        guard API_KEY != nil else {
            return [Video]()
        }
        
        // Create the URL
        let urlString = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=RD_2hwblQ_I20&start_radio=1&rv=_2hwblQ_I20&key=\(API_KEY!)"
        let url = URL(string: urlString)
        
        // Create the request
        if let url = url {
            let request = URLRequest(url: url)
            let session = URLSession.shared
            
            // Send the request
            do {
                let (data, response) = try await session.data(for: request)
                
                // Parse
                let decoder = JSONDecoder()
                let playlist = try decoder.decode(PlayList.self, from: data)
                
                return playlist.items
                
            } catch {
                print(error)
            }

        }
        
        
        
        
        return [Video]()
    }
}
