//
//  SearchVC.swift
//  SWIFT_RxFlow
//
//  Created by 이윤수 on 12/19/23.
//

import UIKit

class SearchVC: BaseVC {
    let viewModel: SearchViewModel
    
    init(
        viewModel: SearchViewModel
    ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemRed
        self.titleLabel.text = "검색"
    }
}

