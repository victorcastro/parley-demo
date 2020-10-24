//
//  NetworkManager.swift
//  parleyclient-ios
//
//  Created by Victor Castro on 13/10/20.
//

import Foundation
import RxSwift

class ManagerConnections {
    
    func getAnnounces() -> Observable<[Announce]> {
        
        return Observable.create { observable in
            let session = URLSession.shared
            var request = URLRequest(url: URL(string: Config.Endpoint.getAnnouncesList)!)
            
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            session.dataTask(with: request) { (data, response, error) in
                guard let data = data, error == nil, let response = response as? HTTPURLResponse else { return }
                
                if response.statusCode == 200 {
                    do {
                        let decoder = JSONDecoder()
                        let announces = try decoder.decode(Announces.self, from: data)
                        observable.onNext(announces.payload)
                    } catch let err {
                        print("No se pudo mapear el Metodo en el response \(err.localizedDescription)")
                    }
                } else if response.statusCode == 401 {
                    print("Error 401!!!")
                }
                observable.onCompleted()
            }.resume()
            
            return Disposables.create {
                session.finishTasksAndInvalidate()
            }
        }
    }
    
    func getDetailAnnounce() {
        
    }
}
