//
//  HomeBannerModel.swift
//  Bank
//
//  Created by FFF on 2022/1/21.
//

import SwiftUI
import Foundation

final class HomeBannerModel: ObservableObject {
    
    /// Banner-Size
    public let homeBannerWidth  = kScreenWidth - 30
    public let homeBannerHeight:CGFloat = 150
    
    var homeBannerArray: Array<String> = [
        "twinlake",
        "umbagog",
        "stmarylake",
        "silversalmoncreek",
        "lakemcdonald"
    ]
    
}

// MARK: -
extension HomeBannerModel{
    
    /// banner个数
    /// - Returns: description
    func homeBannerCount() -> NSInteger {
        
        return homeBannerArray.count
    }
    
    /// banner 图片
    /// - Parameter indexPath: indexPath description
    /// - Returns: description
    func bannerImage(_ indexPath:NSInteger) -> String {
        
        return homeBannerArray[indexPath]
    }
}

