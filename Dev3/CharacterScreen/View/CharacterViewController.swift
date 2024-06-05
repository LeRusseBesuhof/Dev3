import UIKit

final class CharacterViewController: UIViewController, CharacterVCProtocol {
    
    var networkManager : NetworkProtocol! = NetworkService()
    
    private let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    internal lazy var queryItems : QueryItem = QueryItem()
    
    private lazy var logoImageView : UIImageView = {
        .config(view: UIImageView()) {
            $0.image = .rnmlogo
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
            $0.layer.cornerRadius = 20
        }
    }()
    
    private lazy var customPickerView : UIPickerView = {
        .config(view: UIPickerView()) {
            $0.dataSource = self
            $0.delegate = self
            $0.backgroundColor = .systemCyan
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(customPickerView)
        view.addSubview(logoImageView)
        print(queryItems)
        
        activateConstraints()
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            logoImageView.heightAnchor.constraint(equalToConstant: 120),
            
            customPickerView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 30),
            customPickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            customPickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            customPickerView.heightAnchor.constraint(equalToConstant: 400),
        ])
    }
}

extension CharacterViewController : UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { months.count }
}

extension CharacterViewController : UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        300
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        months[row]
    }
}
