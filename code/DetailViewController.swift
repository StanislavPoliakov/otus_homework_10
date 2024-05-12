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
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var nameTitle: UILabel = {
        let nameTitle = UILabel(frame: .zero)
        nameTitle.text = "Имя"
        nameTitle.textColor = .systemMint
        nameTitle.translatesAutoresizingMaskIntoConstraints = false
        return nameTitle
    }()
    
    private lazy var divider1: UIView = {
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
    
    private lazy var jobTitleTitle: UILabel = {
        let title = UILabel(frame: .zero)
        title.text = "Должность"
        title.textColor = .systemMint
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var divider2: UIView = {
        let divider = UIView(frame: .zero)
        divider.bounds = .init(x: 0, y: 0, width: 180, height: 1)
        divider.backgroundColor = .systemMint
        divider.translatesAutoresizingMaskIntoConstraints = false
        return divider
    }()
    
    private lazy var jobTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .systemMint
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var addressTitle: UILabel = {
        let title = UILabel(frame: .zero)
        title.text = "Адрес"
        title.textColor = .systemMint
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var divider3: UIView = {
        let divider = UIView(frame: .zero)
        divider.bounds = .init(x: 0, y: 0, width: 180, height: 1)
        divider.backgroundColor = .systemMint
        divider.translatesAutoresizingMaskIntoConstraints = false
        return divider
    }()
    
    private lazy var addressLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .systemMint
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.sizeToFit()
        return label
    }()
    
    private lazy var showNameButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .systemMint
        button.addTarget(self, action: #selector(didTapOnShowButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var copyToClipboardButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Копировать адрес", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTabOnCopyToClipboardButton), for: .touchUpInside)
        return button
    }()
    
    var data: FictionalCharacter?
    
    private var isFullNameShown: Bool = false {
        didSet {
            nameLabel.text = isFullNameShown ? data?.fullName : data?.firstName
        }
    }
    
    @objc private func didTapOnShowButton(_ sender: UIButton) {
        isFullNameShown.toggle()
        showNameButton.isSelected = isFullNameShown
    }
    
    @objc private func didTabOnCopyToClipboardButton(_ sender: UIButton) {
        UIPasteboard.general.string = addressLabel.text
        
        let alert = UIAlertController(title: "", message: "Адрес: \(String(describing: UIPasteboard.general.string!)) скопирован!", preferredStyle: .alert)
        alert.addAction(.init(title: "Понятно", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        view.addSubview(imageView)
        view.addSubview(nameTitle)
        view.addSubview(divider1)
        view.addSubview(nameLabel)
        view.addSubview(jobTitleTitle)
        view.addSubview(divider2)
        view.addSubview(jobTitleLabel)
        view.addSubview(addressTitle)
        view.addSubview(divider3)
        view.addSubview(addressLabel)
        view.addSubview(showNameButton)
        view.addSubview(copyToClipboardButton)
        
        setUp()
    }
    
    private func setUpImageBlock(with image: String?) {
        guard let image = image else { return }
        imageView.image = UIImage(resource: .init(name: image, bundle: .main))
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1)
        ])
    }
    
    private func setUpNameBlock() {
        isFullNameShown = false
        
        NSLayoutConstraint.activate([
            nameTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            nameTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            divider1.topAnchor.constraint(equalTo: nameTitle.bottomAnchor, constant: 0),
            divider1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            divider1.widthAnchor.constraint(equalToConstant: 180),
            divider1.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: divider1.bottomAnchor, constant: 4),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    private func setUpJobBlock(with job: String?) {
        guard let job = job else { return }
        
        jobTitleLabel.text = job
        NSLayoutConstraint.activate([
            jobTitleTitle.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 40),
            jobTitleTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            jobTitleTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            divider2.topAnchor.constraint(equalTo: jobTitleTitle.bottomAnchor, constant: 0),
            divider2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            divider2.widthAnchor.constraint(equalToConstant: 180),
            divider2.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            jobTitleLabel.topAnchor.constraint(equalTo: divider2.bottomAnchor, constant: 4),
            jobTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            jobTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    private func setUpAddressBlock(with address: String?) {
        guard let address = address else { return }
        
        addressLabel.text = address
        
        NSLayoutConstraint.activate([
            addressTitle.topAnchor.constraint(equalTo: jobTitleLabel.topAnchor, constant: 40),
            addressTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addressTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            divider3.topAnchor.constraint(equalTo: addressTitle.bottomAnchor, constant: 0),
            divider3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            divider3.widthAnchor.constraint(equalToConstant: 180),
            divider3.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: divider3.bottomAnchor, constant: 4),
            addressLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addressLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    private func setUpShowNameButton() {
        NSLayoutConstraint.activate([
            showNameButton.centerYAnchor.constraint(equalTo: divider1.centerYAnchor),
            showNameButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor)
        ])
    }
    
    private func setUpCopyToClipboardButton() {
        NSLayoutConstraint.activate([
//            copyToClipboardButton.topAnchor.constraint(equalTo: addressLabel.bottomAnchor),
            copyToClipboardButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            copyToClipboardButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            copyToClipboardButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            copyToClipboardButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setUp() {
        setUpImageBlock(with: data?.image)
        setUpNameBlock()
        setUpJobBlock(with: data?.jobTitle)
        setUpAddressBlock(with: data?.address)
        setUpShowNameButton()
        setUpCopyToClipboardButton()
    }
}
