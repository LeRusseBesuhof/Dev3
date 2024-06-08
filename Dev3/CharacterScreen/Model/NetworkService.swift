import Foundation
import Alamofire

final class NetworkService {
    
    internal var parameters : Parameters = [String: Any]()
    
    // "https://rickandmortyapi.com/api/character/"
    
    func getRequest(completion: @escaping ([CharacterInfo]) -> Void) {
        
        AF.request(String.host, method: .get, parameters: parameters).response { result in
            guard result.error == nil else {
                print(result.error!.localizedDescription)
                return
            }
            
            guard let jsonData = result.data else {
                print("something wrong with data")
                return
            }
            
            do {
                let clearData = try JSONDecoder().decode(Person.self, from: jsonData)
                
                completion(clearData.results)
            } catch {
                print("something wrong with decoding")
                return
            }
            
        }
        
    }
}

struct Person : Decodable {
    let results : [CharacterInfo]
}

struct CharacterInfo : Decodable {
    let name : String?
    let status : String?
    let gender : String?
    let image : String?
}
