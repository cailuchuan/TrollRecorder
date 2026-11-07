import UIKit

class SubtitleOverlay: UIWindow {
    static let shared = SubtitleOverlay()
    
    private let label: UILabel = {
        let lb = UILabel()
        lb.textColor = .white
        lb.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        lb.font = UIFont.systemFont(ofSize: 22)
        lb.numberOfLines = 0
        lb.textAlignment = .center
        return lb
    }()
    
    private init() {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            super.init(windowScene: scene)
        } else {
            super.init(frame: UIScreen.main.bounds)
        }
        self.windowLevel = .alert + 100
        self.isHidden = true
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant:16),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant:-16),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant:-60)
        ])
    }
    
    func showText(_ text:String) {
        label.text = text
        self.isHidden = false
    }
    
    func hide() {
        self.isHidden = true
    }
}
