//
//  ViewModelBootcamps.swift
//  UIKit+Combine
//
//  Created by Marcos on 3/11/23.
//

import Foundation
import Combine
final class ViewModelBootcamps {
    
     var bootcamps: [Bootcamp] = []
    var isLoading: Bool = false
    
    private let useCase: caseUseBootcamProtocol
    
    init(useCase: CaseUseBootCamp){
        self.useCase = useCase
    }
    
    func getBootcamps() -> AnyPublisher<[Bootcamp], Error>{
        return useCase.loadBootcamps()
    }
    
}
