
import XCTest
@testable import iMovie

final class NetworkServiceMock: NetworkService {
    func request<Request>(_ request: Request) async throws -> Request.Response where Request : iMovie.DataRequest {

        if let data = MockDataGenerator().getMockMoviesData() {
            let decodedData = try request.decode(data)
            return decodedData
        } else {
            throw NSError.createNetworkError()
        }
    }
}
