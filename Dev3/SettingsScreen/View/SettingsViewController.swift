import UIKit

final class SettingsViewController: UIViewController {

    internal var networkManager : NetworkManager = NetworkManager()
    
    internal var presenter : SettingsViewControllerPresenter = SettingsViewControllerPresenter()
    
    private lazy var logoImageView : UIImageView = {
        .config(view: UIImageView()) {
            $0.image = .rnmlogo
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
            $0.layer.cornerRadius = 20
        }
    }()
    
    private lazy var customSegmentControl : UISegmentedControl = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        // $0.setTitleTextAttributes([.font : UIFont.systemFont(ofSize: 3)], for: .normal)
        $0.setTitleTextAttributes([.foregroundColor : UIColor.white], for: .normal)
        $0.setTitleTextAttributes([.foregroundColor : UIColor.black], for: .selected)
        $0.backgroundColor = .black
        $0.selectedSegmentTintColor = .white
        $0.layer.borderColor = UIColor.white.cgColor
        $0.layer.borderWidth = 2.0
        return $0
    }(UISegmentedControl(items: []))
    
    private lazy var deadLabel : UILabel = AppUIFuncs.createLabel(with: "Dead", alignment: .center, font: UIFont.systemFont(ofSize: 24, weight: .bold))
    
    private lazy var aliveLabel : UILabel = AppUIFuncs.createLabel(with: "Alive", alignment: .center, font: UIFont.systemFont(ofSize: 24, weight: .bold))
    
    private lazy var statusSwitch : UISwitch = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isOn = true
        $0.backgroundColor = .white
        $0.layer.cornerRadius = $0.frame.height / 2
        $0.addTarget(self, action: #selector(changeThumbColor(sender: )), for: .valueChanged)
        return $0
    }(UISwitch())
    
    @objc private func changeThumbColor(sender: UISwitch) {
        sender.thumbTintColor = sender.isOn ? .white : .black
    }
    
    private lazy var statusStack : UIStackView = {
        .config(view: UIStackView()) { [weak self] st in
            guard let self = self else { return }
            st.axis = .horizontal
            st.alignment = .center
            st.distribution = .fill
            [deadLabel, statusSwitch, aliveLabel].forEach { st.addArrangedSubview($0) }
        }
    }()
    
    private lazy var maleLabel : UILabel = AppUIFuncs.createLabel(with: "Male", alignment: .center, font: UIFont.systemFont(ofSize: 24, weight: .bold))
    
    private lazy var femaleLabel : UILabel = AppUIFuncs.createLabel(with: "Female", alignment: .center, font: UIFont.systemFont(ofSize: 24, weight: .bold))
    
    private lazy var genderSwitch : UISwitch = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isOn = true
        $0.onTintColor = .systemBlue
        $0.backgroundColor = .systemPink
        $0.layer.cornerRadius = $0.frame.height / 2
        return $0
    }(UISwitch())
    
    private lazy var genderStack : UIStackView = {
        .config(view: UIStackView()) { [weak self] st in
            guard let self = self else { return }
            st.axis = .horizontal
            st.alignment = .center
            st.distribution = .fill
            [femaleLabel, genderSwitch, maleLabel].forEach { st.addArrangedSubview($0) }
        }
    }()
    
    private lazy var settingsStack : UIStackView = {
        .config(view: UIStackView()) { [weak self] st in
            guard let self = self else { return }
            st.axis = .vertical
            st.spacing = 60
            st.alignment = .fill
            st.distribution = .equalSpacing
            [statusStack, genderStack].forEach { st.addArrangedSubview($0) }
        }
    }()
    
    private lazy var getInfoButton : UIButton = {
        .config(view: UIButton()) {
            $0.backgroundColor = .systemGreen
            $0.setTitle("GO", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 48, weight: .heavy)
            $0.layer.cornerRadius = 20
            $0.addAction(self.btnAction, for: .touchUpInside)
        }
    }()
    
    private lazy var btnAction : UIAction = UIAction { [weak self] _ in
        guard let self = self else { return }
        setUpQueryItems()
        if let nextVC = self.presenter.characterPresenter.viewController as? UIViewController {
            self.present(nextVC, animated: true)
        } else {
            print("Something went wrong")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setUpView()
        activateConstraints()
        
        networkManager.getRequest { chars in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                for i in 0..<chars.count {
                    let name = chars[i].name ?? "default"
                    customSegmentControl.insertSegment(withTitle: name, at: i, animated: true)
                }
                customSegmentControl.selectedSegmentIndex = 1
            }
        }
    }
    
    private func setUpView() {
        view.backgroundColor = .black
        [deadLabel, aliveLabel, maleLabel, femaleLabel].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        [logoImageView, customSegmentControl, settingsStack, getInfoButton].forEach { view.addSubview($0) }
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            logoImageView.heightAnchor.constraint(equalToConstant: 120),
            
            customSegmentControl.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 60),
            customSegmentControl.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            customSegmentControl.trailingAnchor.constraint(equalTo: logoImageView.trailingAnchor),
            customSegmentControl.heightAnchor.constraint(equalToConstant: 70),
            
            settingsStack.topAnchor.constraint(equalTo: customSegmentControl.bottomAnchor, constant: 80),
            settingsStack.leadingAnchor.constraint(equalTo: customSegmentControl.leadingAnchor),
            settingsStack.widthAnchor.constraint(equalTo: customSegmentControl.widthAnchor),
            
            statusSwitch.centerXAnchor.constraint(equalTo: statusStack.centerXAnchor),
            genderSwitch.centerXAnchor.constraint(equalTo: genderStack.centerXAnchor),
            
            getInfoButton.topAnchor.constraint(equalTo: settingsStack.bottomAnchor, constant: 120),
            getInfoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getInfoButton.widthAnchor.constraint(equalToConstant: 250),
            getInfoButton.heightAnchor.constraint(equalToConstant: 60)
            
        ])
    }
    
    func setUpQueryItems() {
        presenter.characterPresenter.setUpParameters(
            name: customSegmentControl.titleForSegment(at: customSegmentControl.selectedSegmentIndex) ?? "deafult",
            status: statusSwitch.isOn ? .alive : .dead,
            gender: genderSwitch.isOn ? .male : .female)
    }
}
