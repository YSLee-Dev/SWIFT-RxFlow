//
//  AppSteps.swift
//  SWIFT_RxFlow
//
//  Created by 이윤수 on 12/18/23.
//

import Foundation

import RxFlow

enum AppSteps: Step {
    case tabbar
    case home
    case search
    
    case detail(type: DetailType)
    case detailComplete
}

enum DetailType: String {
    case home = "홈에서 온 디테일"
    case search = "검색에서 온 디테일"
}
