//
//  DeeplinkManager.swift
//  CreateWithSwift
//
//  Created by Paul Mooney on 8/11/22.
//

import Foundation
import UIKit

class DeeplinkManager {
    
    enum DeeplinkTarget: Equatable {
        case home(reference: String)
        case details(reference: String)
    }
    
    class DeepLinkConstants {
        static let scheme = "tel"
//        static let host = "com.example.createwithswiftapp"
//        static let detailsPath = "/details"
//        static let query = "id"
    }
    
    func manage(url: URL) -> DeeplinkTarget {
        let urlStr:String? = url.absoluteString
        var phoneNumber: String!
        if let urlStr {
            phoneNumber = urlStr.filter("0123456789.".contains)
            let linphoneStr = "sip-linphone:" + phoneNumber + "@tampa1.voip.ms"
            let linphoneUrl = URL(string: linphoneStr)!
            UIApplication.shared.open(linphoneUrl)
        }
        
        guard url.scheme == DeepLinkConstants.scheme
//              url.host == DeepLinkConstants.host,
//              url.path == DeepLinkConstants.detailsPath,
//              let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
//              let queryItems = components.queryItems
        else { return .home(reference: phoneNumber) }
        
        
//        let query = queryItems.reduce(into: [String: String]()) { (result, item) in
//            result[item.name] = item.value
//        }
//
//        guard let id = query[DeepLinkConstants.query] else { return .home }
        
        return .details(reference: phoneNumber)
    }
}



