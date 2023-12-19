//
//  DetailVC.swift
//  SWIFT_RxFlow
//
//  Created by 이윤수 on 12/19/23.
//

import UIKit

import RxSwift
import RxCocoa
import NSObject_Rx
import SnapKit
import Then

class DetailVC: BaseVC {
    let viewModel: DetailViewModel
    
    init(
        viewModel: DetailViewModel
    ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("DEINIT Detail")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.attribute()
        self.bind()
    }
}

private extension DetailVC {
    func attribute() {
        self.view.backgroundColor = .systemGreen
        self.moveBtn.setTitle("돌아가기", for: .normal)
    }
    
    func bind() {
        let input = DetailViewModel.Input(
            backBtn: self.moveBtn.rx.tap
                .asObservable()
        )
        
        let output = self.viewModel.transform(input: input)
        output.title
            .drive(self.titleLabel.rx.text)
            .disposed(by: rx.disposeBag)
    }
}

