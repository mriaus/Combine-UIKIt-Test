//
//  BootcampsUseCase.swift
//  UIKit+Combine
//
//  Created by Marcos on 3/11/23.
//

import Foundation
import Combine
protocol caseUseBootcamProtocol {
    func loadBootcamps() -> AnyPublisher<[Bootcamp], Error>
    
}

final class CaseUseBootCamp: caseUseBootcamProtocol {
    
    
    func loadBootcamps() -> AnyPublisher<[Bootcamp], Error> {
           guard let url = URL(string: "https://dragonball.keepcoding.education/api/data/bootcamps") else {
               print("URL inválida")
               return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
           }

           var request: URLRequest = URLRequest(url: url)
           request.httpMethod = "GET"

           return URLSession.shared.dataTaskPublisher(for: request)
               .tryMap { data, response in
                   guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                       throw URLError(.badServerResponse)
                   }
                   return data
               }
               .decode(type: [Bootcamp].self, decoder: JSONDecoder())
               .receive(on: DispatchQueue.main)
               .eraseToAnyPublisher()
       }
    
    
}
