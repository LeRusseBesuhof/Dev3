import Foundation
// import Alamofire

final class NetworkManager {
    
    private let queryParameters : QueryParameters = QueryParameters(numberOfCharacters: 3)
    
    private lazy var queryString : String = NetworkDataFuncs.generateRandomNumbers(count: queryParameters.numberOfCharacters)
    
    internal lazy var url: URL! = URL(string: String.host + queryString)
    
    // https://rickandmortyapi.com/api/character/1,2,3,4,5,
    
    internal var request: URLRequest?
    
    func getRequest(completion: @escaping ([Character]) -> Void) {
        request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        
        URLSession.shared.dataTask(with: request!) { data, response, err in
            
            var dataResponse : [Character]!
            guard err == nil else {
                print(RequestError.responseError.rawValue, err!.localizedDescription)
                dataResponse = [Character(name: "rick"), Character(name: "morty"), Character(name: "summer")]
                completion(dataResponse)
                return
            }
            
            do {
                dataResponse = try JSONDecoder().decode([Character].self, from: data!)
                
                completion(dataResponse)
            } catch {
                print(RequestError.dataError.rawValue, err!.localizedDescription)
            }
            
        }.resume()
    }
    
    // MARK: really needed?
    enum RequestError : String {
        case responseError = "Something went wrong with response!"
        case dataError = "Something went wrong with data!"
    }

}

struct Character : Decodable {
    let name : String?
}
