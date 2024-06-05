import Foundation
import Alamofire

final class NetworkService : NetworkProtocol {
    var url: URL!
    
    var request: URLRequest?
    
    func getRequest(completion: @escaping ([Character]) -> Void) {
        //
    }
}
