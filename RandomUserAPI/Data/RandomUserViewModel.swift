//
//  RandomUserViewModel.swift
//  RandomUserAPI
//
//  Created by 최동현 on 2023/05/07.
//

import Foundation
import Combine
import Alamofire

class RandomUserViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    
    @Published var randomUsers = [RandomUser]()
    
    var baseUrl = "https://randomuser.me/api/?results=100"
    
    init() {
        print(#fileID, #function, #line, "")
        fetchRandomUsers()
    }
    
    func fetchRandomUsers() {
        print(#fileID, #function, #line, "")
        AF.request(baseUrl)
            .publishDecodable(type: RandomUserResponse.self)
            .compactMap{ $0.value }
            .map { $0.results }
            .sink(receiveCompletion: { completion in
                print("데이터 스트림 완료")
            }, receiveValue: { [weak self] (receivedValue: [RandomUser]) in
                guard let self = self else { return }
                print("받은 값 : \(receivedValue.count)")
                self.randomUsers = receivedValue
            }).store(in: &subscription)
    }
}
