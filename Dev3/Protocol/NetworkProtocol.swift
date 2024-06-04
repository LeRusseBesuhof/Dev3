import Foundation

protocol NetworkProtocol {
    var url : URL! { get set }
    var request : URLRequest? { get set }
    func getRequest(completion: @escaping ([Character]) -> Void)
}
