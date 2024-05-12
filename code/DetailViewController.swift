//
//  DetailViewController.swift
//  code
//
//  Created by Поляков Станислав Денисович on 12.05.2024.
//

import UIKit

class DetailViewController: UIViewController {

//    @IBOutlet private weak var imageView: UIImageView!
//    
//    @IBOutlet private weak var nameLabel: UILabel!
//    @IBOutlet private weak var jobTitleLabel: UILabel!
//    @IBOutlet private weak var addressLabel: UILabel!
//    
//    @IBOutlet private weak var showNameButton: UIButton!
//    @IBOutlet private weak var copyToClipboardButton: UIButton!
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(resource: .init(name: data?.image ?? "bear", bundle: .main))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameTitle: UILabel = {
        let nameTitle = UILabel(frame: .zero)
        nameTitle.text = "Имя"
        nameTitle.textColor = .systemMint
        nameTitle.translatesAutoresizingMaskIntoConstraints = false
        return nameTitle
    }()
    
    private lazy var divider: UIView = {
        let divider = UIView(frame: .zero)
        divider.bounds = .init(x: 0, y: 0, width: 180, height: 1)
        divider.backgroundColor = .systemMint
        divider.translatesAutoresizingMaskIntoConstraints = false
        return divider
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel(frame: .zero)
        nameLabel.textColor = .systemMint
        nameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    var data: FictionalCharacter?
    
    private var isFullNameShown: Bool = false {
        didSet {
            nameLabel.text = isFullNameShown ? data?.fullName : data?.firstName
        }
    }
    
//    @IBAction private func didTapOnShowButton(_ sender: UIButton) {
//        isFullNameShown.toggle()
//        showNameButton.isSelected = isFullNameShown
//    }
    
//    @IBAction func didTabOnCopyToClipboardButton(_ sender: UIButton) {
//        UIPasteboard.general.string = addressLabel.text
//        
//        let alert = UIAlertController(title: "", message: "Адрес: \(String(describing: UIPasteboard.general.string!)) скопирован!", preferredStyle: .alert)
//        alert.addAction(.init(title: "Понятно", style: .default))
//        self.present(alert, animated: true, completion: nil)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
//        imageView.frame = CGRect(x: view.safeAreaInsets.left, y: view.safeAreaInsets.top, width: 100, height: 200)
        view.addSubview(imageView)
        view.addSubview(nameTitle)
        view.addSubview(divider)
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
//            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            nameTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 350),
            nameTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            divider.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 370),
            divider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            divider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 380),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        setUp()
    }
    
    private func setUp() {
        isFullNameShown = false
//        jobTitleLabel.text = data?.jobTitle
//        addressLabel.text = data?.address
//        addressLabel.sizeToFit()
        
//        showNameButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
//        showNameButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
    }
}
