//
//  ViewController.swift
//  NYCSchool
//
//  Created by Las Suleman on 10/5/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let api = SchoolAPI();
        api.getSchools { result in
            switch result{
            case .failure(let  error):
                print(error)
                
            case .success(let schools):
                if let schools = schools{
                    print("Found schools")
                }
            }
        }
       
    }


}

