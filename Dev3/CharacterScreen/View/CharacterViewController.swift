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
    
    private lazy var canvasView : UIView = {
        .config(view: $0) {
            $0.layer.cornerRadius = 15
            $0.backgroundColor = .darkGray
        }
    }(UIView())
    
    private lazy var imageView : UIImageView = {
        .config(view: UIImageView()) {
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
            $0.layer.cornerRadius = 150
        }
    }()
    
    private lazy var nameLabel : UILabel = AppUIFuncs.createLabel(alignment: .center, font: UIFont.getCreepsterFont(fontSize: 40))
    
    private lazy var statusLabel : UILabel = AppUIFuncs.createLabel(with: "\u{2022} Status: ", alignment: .left, font: UIFont.getShadowFont(fontSize: 32))
    
    private lazy var genderLabel : UILabel = AppUIFuncs.createLabel(with: "\u{2022} Gender: ", alignment: .left, font: UIFont.getShadowFont(fontSize: 32))
    
    func prepareForReuse() {
        imageView.image = nil
    }
    
    private lazy var customPickerView : UIPickerView = {
        .config(view: UIPickerView()) {
            $0.dataSource = self
            $0.delegate = self
            $0.backgroundColor = .systemCyan
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        activateConstraints()
        
        /*
        let imageUrl = URL(string: item.image ?? "")
        imageView.load(url: imageUrl!)
        nameLabel.text = item.name ?? ""
        statusLabel.text = "\u{2022} Status: \(item.status ?? "")"
        genderLabel.text = "\u{2022} Gender: \(item.gender ?? "")"
        
        [imageView, nameLabel, statusLabel, genderLabel].forEach { canvasView.addSubview($0) }
        addSubview(canvasView)
         */
    }
    
    private func setUpView() {
        view.backgroundColor = .black
        // [imageView, nameLabel, statusLabel, genderLabel].forEach { canvasView.addSubview($0) }
        [logoImageView, customPickerView].forEach { view.addSubview($0) }
        
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
            
            canvasView.leadingAnchor.constraint(equalTo: customPickerView.leadingAnchor),
            canvasView.trailingAnchor.constraint(equalTo: customPickerView.trailingAnchor),
            canvasView.widthAnchor.constraint(equalTo: customPickerView.widthAnchor),
            canvasView.heightAnchor.constraint(equalTo: customPickerView.heightAnchor),
    
//            imageView.topAnchor.constraint(equalTo: canvasView.topAnchor, constant: 26),
//            imageView.centerXAnchor.constraint(equalTo: canvasView.centerXAnchor),
//            imageView.widthAnchor.constraint(equalToConstant: 300),
//            imageView.heightAnchor.constraint(equalToConstant: 300),
//            
//            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
//            nameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
//            nameLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
//            
//            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
//            statusLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
//            statusLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
//            
//            genderLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor),
//            genderLabel.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
//            genderLabel.trailingAnchor.constraint(equalTo: statusLabel.trailingAnchor),
            
            // genderLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
        ])
    }
}

extension CharacterViewController : UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { months.count }
}

extension CharacterViewController : UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        500
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        months[row]
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        canvasView
    }
}
