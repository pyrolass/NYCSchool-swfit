//
//  SchoolDirectoryAPI.swift
//  NYCSchool
//
//  Created by Las Suleman on 10/5/22.
//

import Foundation
import Alamofire
typealias ScholListApiResponse =   ((Swift.Result<[School]? , DataError>)->Void)

protocol SchoolAPILogic{
    func getSchools(completion :  @escaping (ScholListApiResponse))
}

class SchoolAPI:SchoolAPILogic{
    func getSchools(completion : @escaping (ScholListApiResponse)) {
    
        AF.request(schoolListUrl).validate().responseDecodable(of:[School].self) { response in
            switch response.result{
            case .failure(let error):
                completion(.failure(.networkingError(error.localizedDescription)))
                break
            case .success(let schools):
                completion(.success(schools))
                break
            }
        }
    }
    
    private func retrieveSchoolsUsingStandardServices(){
//        var urlComponents = URLComponents()
//        urlComponents.scheme = "https"
//        urlComponents.host = "data.cityofnewyork.us"
//        urlComponents.path = "resource/s3k6-pzi2.json"
        
        var urlComponents = URL(string: schoolListUrl)
        
        if let url = urlComponents{
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url) { data, res, error in
                guard  error == nil else{
                    print(error)
                    return
                }
                if let data = data{
                    let decoder = JSONDecoder()
                    do{
                       let schools =  try decoder.decode([School].self, from: data)
                        print(schools)
                    }catch let error {
                        print(error)
                    }
                    
                }
                
            }
            task.resume()
        }
    }
    
}
