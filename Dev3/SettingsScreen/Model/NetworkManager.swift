import Foundation
// import Alamofire

protocol NetworkProtocol {
    var url : URL! { get set }
    var request : URLRequest? { get set }
    func getRequest(completion: @escaping ([Character]) -> Void)
}

final class NetworkManager : NetworkProtocol {
    
    internal var url: URL! = URL(string: "https://rickandmortyapi.com/api/character/1,2,3,4,5")
    
    // https://rickandmortyapi.com/api/character/1,2,3,4,5
    
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
}

struct Character : Decodable {
    let name : String?
    let status : String?
    let species : String?
    let gender : String?
    let image : String?
}
