//
//  MainVC.swift
//  SWIFT_RxFlow
//
//  Created by 이윤수 on 12/17/23.
//

import UIKit

import RxSwift
import RxCocoa
import NSObject_Rx
import SnapKit
import Then

class MainVC: BaseVC {
    let detailBtn = UIButton().then {
        $0.setTitle("디테일로 이동", for: .normal)
    }
    
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
        
        self.layout()
        self.attribute()
        self.bind()
    }
}

private extension MainVC {
    func attribute() {
        self.view.backgroundColor = .systemGreen
        self.titleLabel.text = "홈"
        self.moveBtn.setTitle("검색으로 이동", for: .normal)
    }
    
    func layout() {
        self.view.addSubview(self.detailBtn)
        self.detailBtn.snp.makeConstraints {
            $0.top.equalTo(self.moveBtn.snp.bottom).offset(20)
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func bind() {
        let input = MainViewModel.Input(
            searchBtnTap: self.moveBtn.rx.tap
                .asObservable(),
            detailBtnTap: self.detailBtn.rx.tap
                .asObservable()
        )
        
        _ = self.viewModel.transform(input: input)
    }
}
