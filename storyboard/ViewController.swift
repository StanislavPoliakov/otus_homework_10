//
//  ViewController.swift
//  otus_homework_10
//
//  Created by Поляков Станислав Денисович on 11.05.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var imageView: UIImageView!
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var jobTitleLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    
    @IBOutlet private weak var showNameButton: UIButton!
    @IBOutlet private weak var copyToClipboardButton: UIButton!
    
    var data: FictionalCharacter?
    
    private var isFullNameShown: Bool = false {
        didSet {
            nameLabel.text = isFullNameShown ? data?.fullName : data?.firstName
        }
    }
    
    @IBAction private func didTapOnShowButton(_ sender: UIButton) {
        isFullNameShown.toggle()
        showNameButton.isSelected = isFullNameShown
    }
    
    @IBAction func didTabOnCopyToClipboardButton(_ sender: UIButton) {
        UIPasteboard.general.string = addressLabel.text
        
        let alert = UIAlertController(title: "", message: "Адрес: \(String(describing: UIPasteboard.general.string!)) скопирован!", preferredStyle: .alert)
        alert.addAction(.init(title: "Понятно", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp() {
        isFullNameShown = false
        jobTitleLabel.text = data?.jobTitle
        addressLabel.text = data?.address
        addressLabel.sizeToFit()
        
        imageView.image = UIImage(resource: .init(name: data?.image ?? "bear", bundle: .main))
        
        showNameButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        showNameButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
    }
}

