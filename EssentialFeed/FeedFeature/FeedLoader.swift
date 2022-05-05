import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}

class RemoteFeedLoader {
    
    let client: HTTPClient
    let url: URL

    func load() {
        client.get(from: url)
    }
    
    init(url: URL, client: HTTPClient) {
        self.client = client
        self.url = url
    }
}

protocol HTTPClient {
    func get(from url: URL?)
}
