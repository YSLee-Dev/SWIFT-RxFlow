//
//  MainVC.swift
//  SWIFT_RxFlow
//
//  Created by 이윤수 on 12/17/23.
//

import UIKit

class MainVC: UIViewController {
    let viewModel: MainViewModel
    
    init(
        viewModel: MainViewModel
    ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}

