//
//  LandingViewController.swift
//  UserInterface
//
//  Created by Fernando Moya de Rivas on 01/09/2019.
//  Copyright © 2019 Fernando Moya de Rivas. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController, Bindable {
    
    @IBOutlet weak var goButton: UIButton! {
        didSet {
            goButton.layer.cornerRadius = goButton.bounds.width / 2
            goButton.layer.borderWidth = 2
            goButton.layer.borderColor = UIColor.white.cgColor
            goButton.layer.masksToBounds = true
        }
    }
    
    @IBAction func userDidTapGo(_ sender: UIButton) {
        viewModel.goDidTap(sender: sender)
    }
    
    var viewModel: LandingViewModel
    
    init(viewModel: LandingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bindViewModel() { }
    
}
