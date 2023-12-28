//
//  SearchVC.swift
//  SWIFT_RxFlow
//
//  Created by 이윤수 on 12/19/23.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

class SearchVC: BaseVC {
    let detailBtn = UIButton().then {
        $0.setTitle("디테일로 이동", for: .normal)
    }
    
    let homeDetailBtn = UIButton().then {
        $0.setTitle("홈 디테일로 이동", for: .normal)
    }
    
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
        
        self.layout()
        self.attribute()
        self.bind()
    }
}

private extension SearchVC {
    func attribute() {
        self.view.backgroundColor = .systemRed
        self.titleLabel.text = "검색"
        self.moveBtn.setTitle("홈으로 이동", for: .normal)
    }
    
    func layout() {
        [self.detailBtn, self.homeDetailBtn]
            .forEach {
                self.view.addSubview($0)
            }
        self.detailBtn.snp.makeConstraints {
            $0.top.equalTo(self.moveBtn.snp.bottom).offset(20)
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview()
        }
        
        self.homeDetailBtn.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func bind() {
        let input = SearchViewModel.Input(
            homeBtnTap: self.moveBtn.rx.tap
                .asObservable(),
            detailBtnTap: self.detailBtn.rx.tap
                .asObservable(),
            homeDetailBtnTap: self.homeDetailBtn.rx.tap
                .asObservable()
        )
        
        _ = self.viewModel.transform(input: input)
    }
}
