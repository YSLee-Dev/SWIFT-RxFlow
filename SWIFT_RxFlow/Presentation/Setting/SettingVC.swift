//
//  SettingVC.swift
//  SWIFT_RxFlow
//
//  Created by 이윤수 on 12/20/23.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

class SettingVC: BaseVC {
    let popBtn = UIButton().then {
        $0.setTitle("처음으로 돌아가기", for: .normal)
    }
    
    let viewModel: SettingViewModel
    
    init(
        viewModel: SettingViewModel
    ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("DEINIT Setting")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.layout()
        self.attribute()
        self.bind()
    }
}

private extension SettingVC {
    func attribute() {
        self.view.backgroundColor = .systemPurple
        self.titleLabel.text = "설정"
        self.moveBtn.setTitle("이전으로 이동", for: .normal)
    }
    
    func layout() {
        self.view.addSubview(self.popBtn)
        self.popBtn.snp.makeConstraints {
            $0.top.equalTo(self.moveBtn.snp.bottom).offset(20)
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func bind() {
        let input = SettingViewModel.Input(
            backBtnTap: self.moveBtn.rx.tap
                .asObservable(),
            popBtnTap: self.popBtn.rx.tap
                .asObservable()
        )
        
        _ = self.viewModel.transform(input: input)
    }
}

