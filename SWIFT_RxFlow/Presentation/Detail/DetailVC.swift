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
    let otherBtn = UIButton()
    let settingBtn = UIButton().then {
        $0.setTitle("설정으로 이동", for: .normal)
    }
    
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
        
        self.layout()
        self.attribute()
        self.bind()
    }
}

private extension DetailVC {
    func attribute() {
        self.view.backgroundColor = .systemGray
        self.moveBtn.setTitle("돌아가기", for: .normal)
    }
    
    func layout() {
        self.view.addSubview(self.otherBtn)
        self.otherBtn.snp.makeConstraints {
            $0.top.equalTo(self.moveBtn.snp.bottom).offset(20)
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview()
        }
        
        self.view.addSubview(self.settingBtn)
        self.settingBtn.snp.makeConstraints {
            $0.top.equalTo(self.otherBtn.snp.bottom).offset(20)
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func bind() {
        let input = DetailViewModel.Input(
            backBtnTap: self.moveBtn.rx.tap
                .asObservable(),
            otherVCBtnTap: self.otherBtn.rx.tap
                .asObservable(),
            settingBtnTap: self.settingBtn.rx.tap
                .asObservable()
        )
        
        let output = self.viewModel.transform(input: input)
        output.title
            .drive(self.titleLabel.rx.text)
            .disposed(by: rx.disposeBag)
        
        output.btnTitle
            .asObservable()
            .withUnretained(self)
            .subscribe(onNext: { vc, text in
                vc.otherBtn.setTitle(text, for: .normal)
            })
            .disposed(by: rx.disposeBag)
    }
}

