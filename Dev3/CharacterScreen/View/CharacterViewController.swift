import UIKit

final class CharacterViewController: UIViewController {
    
    var networkService : NetworkService  = NetworkService()
    
    private lazy var logoImageView : UIImageView = {
        .config(view: UIImageView()) {
            $0.image = .rnmlogo
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
            $0.layer.cornerRadius = 20
        }
    }()
    
    // MARK: почему при добавлении этого элемента в pickerView, отображение некорректно?
    /*
    private lazy var canvasView : UIView = {
        $0.layer.cornerRadius = 15
        $0.backgroundColor = .red
        return $0
    }(UIView())
     */
    
    private lazy var label : UILabel = {
        $0.text = "Hello World"
        $0.backgroundColor = .green
        return $0
    }(UILabel())
    
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
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .systemCyan
        return $0
    }(UIPickerView(frame: view.frame))
    
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
        [customPickerView].forEach { view.addSubview($0) }
        networkService.getRequest { chars in
            //
        }
        
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
//            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
//            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            logoImageView.heightAnchor.constraint(equalToConstant: 120),
            
//            customPickerView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 30),
//            customPickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            customPickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            customPickerView.heightAnchor.constraint(equalToConstant: 400),
            
//            canvasView.leadingAnchor.constraint(equalTo: customPickerView.leadingAnchor),
//            canvasView.trailingAnchor.constraint(equalTo: customPickerView.trailingAnchor),
//            canvasView.widthAnchor.constraint(equalTo: customPickerView.widthAnchor),
//            canvasView.heightAnchor.constraint(equalTo: customPickerView.heightAnchor),
    
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
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        5
    }
}

extension CharacterViewController : UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let canvasView : UIView = {
            $0.layer.cornerRadius = 15
            $0.backgroundColor = .red
            return $0
        }(UIView())
        
        return canvasView
    }
    

}
