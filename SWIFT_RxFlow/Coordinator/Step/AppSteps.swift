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
    case detailComplete(type: DetailType)
    
    case setting
    case settingComplete(isAll: Bool)
}

enum DetailType: String {
    case home = "ROOT: HOME"
    case search = "ROOT: SEARCH"
    case homeSetting = "ROOT: HOME, SETTING"
    case searchToHome = "ROOT: SEARCH > HOME "
    case none = ""
}
