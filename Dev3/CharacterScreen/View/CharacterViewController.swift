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
    
    private lazy var customPickerView : UIPickerView = {
        .config(view: UIPickerView()) {
            $0.backgroundColor = .cyan
            $0.dataSource = self
            $0.delegate = self
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
        networkService.getRequest { chars in
            for char in chars {
                //
            }
        }
        
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
            customPickerView.heightAnchor.constraint(equalToConstant: 350),
        ])
    }
}

extension CharacterViewController : UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { 5 }
}

extension CharacterViewController : UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat { 100 }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let canvasView : UIView = {
            $0.layer.cornerRadius = 15
            $0.backgroundColor = .darkGray
            return $0
        }(UIView())
        
        let imageView : UIImageView = {
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 40
            $0.frame = CGRect(x: 10, y: 10, width: 80, height: 80)
            return $0
        }(UIImageView())
        
        let nameLabel : UILabel = AppUIFuncs.createLabel(
            with: "Hello world",
            size: CGRect(x: 100, y: 10, width: 220, height: 40),
            alignment: .center,
            font: UIFont.getCreepsterFont(fontSize: 40))
        
        let statusLabel : UILabel = AppUIFuncs.createLabel(
            with: "\u{2022} ",
            size: CGRect(x: nameLabel.frame.minX, y: nameLabel.frame.maxY, width: 110, height: 40),
            alignment: .left,
            font: UIFont.getShadowFont(fontSize: 24))
        
        let genderLabel : UILabel = AppUIFuncs.createLabel(
            with: "\u{2022} ",
            size: CGRect(x: statusLabel.frame.maxX + 10, y: nameLabel.frame.maxY, width: 100, height: 40),
            alignment: .left,
            font: UIFont.getShadowFont(fontSize: 24))
        
        [imageView, nameLabel, statusLabel, genderLabel].forEach { canvasView.addSubview($0) }
        
        return canvasView
    }
}
