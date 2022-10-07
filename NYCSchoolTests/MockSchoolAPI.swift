//
//  MockSchoolAPI.swift
//  NYCSchoolTests
//
//  Created by Las Suleman on 10/7/22.
//

import Foundation
import XCTest
@testable import NYCSchool
class MockSchoolAPI:SchoolAPILogic{
    var loadState:SchoolListLoadState = .empty
    func getSchools(completion: @escaping (NYCSchool.ScholListApiResponse)) {
        switch loadState {
        case .error:
            completion(.failure(.networkingError("COuld not fetch schools")))
        case .loaded:
            let mock = School(dbn: <#T##String#>,
                              schoolName: <#T##String?#>,
                              overviewParagraph: <#T##String?#>,
                              schoolEmail: <#T##String?#>,
                              academicOpportunities1: <#T##String?#>,
                              academicOpportunities2: <#T##String?#>,
                              neighborhood: <#T##String?#>,
                              phoneNumber: <#T##String?#>,
                              website: <#T##String?#>,
                              finalgrades: <#T##String?#>,
                              totalStudents: <#T##String?#>,
                              schoolSports: <#T##String?#>,
                              primaryAddressLine: <#T##String?#>,
                              city: <#T##String?#>,
                              zip: <#T##String?#>,
                              latitude: <#T##String?#>,
                              longitude: <#T##String?#>)
            completion(.success([mock]))
        case .empty:
            completion(.success([]))
        }
    }
    
    
}
