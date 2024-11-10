import Alamofire
import Foundation

final class HttpGatewayManager {

    private let successStatusCodes = 200 ..< 399

    static let clientErrorStatusCode = -1

    private func handleResponse<T: Decodable>(
        response: AFDataResponse<T>,
        completion: @escaping ((T) -> Void),
        errorCompletion: ((HttpError) -> Void)?
    ) {
        switch response.result {
        case let .success(model):
            completion(model)
        case let .failure(error):
            print(error)
            errorCompletion?(
                HttpError(errorCode: response.response?.statusCode ?? HttpGatewayManager.clientErrorStatusCode)
            )
        }
    }

    public func get<Response: Decodable>(
        route: String,
        headers: HTTPHeaders = [],
        completion: @escaping ((Response) -> Void),
        errorCompletion: ((HttpError) -> Void)?
    ) -> DataRequest {
        AF.request(
            getApiUrl(route: route),
            method: HTTPMethod.get,
            headers: headers
        )
        .validate(statusCode: successStatusCodes)
        .responseDecodable(of: Response.self) { [weak self] response in
            self?.handleResponse(
                response: response,
                completion: completion,
                errorCompletion: errorCompletion
            )
        }
    }

    private func getApiUrl(route: String) -> String {
        "https://jsonplaceholder.typicode.com/\(route)"
    }
}
