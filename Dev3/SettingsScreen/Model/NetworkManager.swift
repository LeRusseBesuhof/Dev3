import Foundation
// import Alamofire

final class NetworkManager : NetworkProtocol {
    
    private let queryParameters : QueryParameters = QueryParameters(numberOfCharacters: 3)
    
    private lazy var queryString : String = NetworkDataFuncs.generateRandomNumbers(count: queryParameters.numberOfCharacters)
    
    internal lazy var url: URL! = URL(string: "https://rickandmortyapi.com/api/character/" + queryString)
    
    // https://rickandmortyapi.com/api/character/1,2,3,4,5,
    
    internal var request: URLRequest?
    
    func getRequest(completion: @escaping ([Character]) -> Void) {
        request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        
        URLSession.shared.dataTask(with: request!) { data, response, err in
            
            guard err == nil else {
                print(RequestError.responseError.rawValue, err!.localizedDescription)
                return
            }
            
            do {
                let dataResponse = try JSONDecoder().decode([Character].self, from: data!)
                
                completion(dataResponse)
            } catch {
                print(RequestError.dataError.rawValue)
                print(err!.localizedDescription)
            }
            
        }.resume()
    }
    
    enum RequestError : String {
        case responseError = "Something went wrong with response!"
        case dataError = "Something went wrong with data!"
    }
    
//    func setUpCharacterRequestQueryItems() -> [String : String] {
//
//    }
}

struct Character : Decodable {
    let name : String?
}
