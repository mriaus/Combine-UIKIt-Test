//
//  Extension+URLResponse.swift
//  UIKit+Combine
//
//  Created by Marcos on 3/11/23.
//

import Foundation

extension URLResponse {
    
    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}
