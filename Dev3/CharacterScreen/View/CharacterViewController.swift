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
    
//    private lazy var testView : UIView = {
//        $0.backgroundColor = .red
//        return $0
//    }(UIView(frame: CGRect(x: view.center.x, y: 100, width: 50, height: 50)))
    
    private lazy var customPickerView : UIPickerView = {
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .systemCyan
        return $0
    }(UIPickerView(frame: view.frame))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
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
}

extension CharacterViewController : UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        5
    }
}

extension CharacterViewController : UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        400
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let canvasView : UIView = {
            $0.layer.cornerRadius = 15
            $0.backgroundColor = .red
            return $0
        }(UIView())
        
        let imageView : UIImageView = {
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
            $0.backgroundColor = .white
            // $0.layer.cornerRadius = 150
            $0.frame = CGRect(x: canvasView.frame.midX, y: 26, width: 50, height: 50)
            // $0.center.x = canvasView.center.x
            return $0
        }(UIImageView())
        
        let nameLabel : UILabel = AppUIFuncs.createLabel(
            size: CGRect(x: imageView.frame.minX, y: imageView.frame.maxY + 15, width: imageView.frame.width, height: 40),
            alignment: .center,
            font: UIFont.getCreepsterFont(fontSize: 40))
        
        let statusLabel : UILabel = AppUIFuncs.createLabel(
            with: "\u{2022} Status: ",
            size: CGRect(x: imageView.frame.minX, y: nameLabel.frame.maxY + 10, width: imageView.frame.width, height: 35),
            alignment: .left,
            font: UIFont.getShadowFont(fontSize: 32))
        
        let genderLabel : UILabel = AppUIFuncs.createLabel(
            with: "\u{2022} Gender: ",
            size: CGRect(x: imageView.frame.minX, y: statusLabel.frame.maxY, width: imageView.frame.width, height: 35),
            alignment: .left,
            font: UIFont.getShadowFont(fontSize: 32))
        
        // [imageView].forEach { canvasView.addSubview($0) }
        canvasView.addSubview(imageView)
        
        return canvasView
    }
    

}
