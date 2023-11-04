//
//  ViewModelBootcamps.swift
//  UIKit+Combine
//
//  Created by Marcos on 3/11/23.
//

import Foundation
import Combine
final class ViewModelBootcamps {
    
    @Published var bootcamps: [Bootcamp] = []
    private var cancellables = Set<AnyCancellable>()
    var isLoading: Bool = false
    
    private let useCase: caseUseBootcamProtocol
    
    init(useCase: CaseUseBootCamp){
        self.useCase = useCase
    }
    
    func getBootcamps() {
        useCase.loadBootcamps()
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] bootcamps in
                self?.bootcamps = bootcamps
            })
            .store(in: &cancellables)
    }
}
