//
//  DeeplinkManager.swift
//  LinphoneAutoDial
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

    }
    
    func manage(url: URL) -> DeeplinkTarget {
        let server: String! = "<server_address>" // change this
        var phoneNumber: String!
        var urlStr:String! = url.absoluteString
        urlStr = urlStr.removingPercentEncoding // remove %20 from string
        if let urlStr {
            phoneNumber = urlStr.trimmingCharacters(in: .whitespacesAndNewlines) // remove whitespaces
            phoneNumber = phoneNumber.filter("0123456789.".contains) // remove non-numerical characters
            let linphoneStr = "sip-linphone:" + phoneNumber + "@" + server
            let linphoneUrl = URL(string: linphoneStr)!
            UIApplication.shared.open(linphoneUrl)
        }
        
        guard url.scheme == DeepLinkConstants.scheme

        else { return .home(reference: phoneNumber) }
        
    
        return .details(reference: phoneNumber)
    }
}



