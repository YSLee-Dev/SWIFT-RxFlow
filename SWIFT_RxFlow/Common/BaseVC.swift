//
//  BaseVC.swift
//  SWIFT_RxFlow
//
//  Created by 이윤수 on 12/19/23.
//

import UIKit

import Then
import SnapKit

class BaseVC: UIViewController {
    let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    let moveBtn = UIButton(type: .system).then {
        $0.tintColor = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.layout()
    }
}

private extension BaseVC {
    func layout() {
        [self.titleLabel, self.moveBtn]
            .forEach {
                self.view.addSubview($0)
            }
        
        self.titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(30)
        }
        
        self.moveBtn.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(20)
        }
    }
}
