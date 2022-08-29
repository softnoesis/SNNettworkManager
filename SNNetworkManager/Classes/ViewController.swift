//
//  ViewController.swift
//  SNNetworkManager
//
//  Created by iChirag on 27/08/22.
//  Copyright © 2022 Softnoesis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Actions
    @IBAction func getRequestAction(_ sender: Any) {
        getAPIRequest()
    }
    
    @IBAction func postRequestAction(_ sender: Any) {
        postAPIRequest()
    }
    
    @IBAction func putRequestAction(_ sender: Any) {
        putAPIRequest()
    }
    
    @IBAction func deleteRequestAction(_ sender: Any) {
        deleteAPIRequest()
    }
    
    @IBAction func uploadImageRequestAction(_ sender: Any) {
        uploadDataAPIRequest()
    }
}

// MARK: - API
extension ViewController {
    func getAPIRequest() {
        
        /**
         Here BaseURL is "https://restcountries.com/v2/" and rest of part is "all" also store in API enum
         */
        
        SNNetworkManager.shared.requestGet(path: API.all.rawValue, params: []) { success, failure, statuscode in
            if failure == nil {
                print(success as Any)
            } else {
                print("Error: \(failure?.localizedDescription ?? "")\nStatusCode: \(statuscode)")
            }
        }
    }
    
    func postAPIRequest() {
        let param = ["Key": "Value"]
        
        SNNetworkManager.shared.requestPost(path: API.all.rawValue, params: param, contentType: .applicationJson) { success, failure, statuscode in
            if failure == nil {
                print(success as Any)
            } else {
                print("Error: \(failure?.localizedDescription ?? "")\nStatusCode: \(statuscode)")
            }
        }
    }
    
    func putAPIRequest() {
        
        SNNetworkManager.shared.requestPut(path: API.currency.rawValue, params: [:], contentType: .applicationJson) { success, failure, statuscode in
            if failure == nil {
                print(success as Any)
            } else {
                print("Error: \(failure?.localizedDescription ?? "")\nStatusCode: \(statuscode)")
            }
        }
    }
    
    func deleteAPIRequest() {
        SNNetworkManager.shared.requestDelete(path: API.currency.rawValue, params: [:]) { success, failure, statuscode in
            if failure == nil {
                print(success as Any)
            } else {
                print("Error: \(failure?.localizedDescription ?? "")\nStatusCode: \(statuscode)")
            }
        }
    }
    
    func uploadDataAPIRequest() {
        let imageData = UIImage(named: "xyz")?.jpegData(compressionQuality: 1) ?? Data()
        
        let param = ["id": "123",
                     "image": imageData] as [String : Any]
        
        SNNetworkManager.shared.requestUploadImage(path: API.all.rawValue, params: param, contentType: .formData) { success, failure, statuscode in
            if failure == nil {
                print(success as Any)
            } else {
                print("Error: \(failure?.localizedDescription ?? "")\nStatusCode: \(statuscode)")
            }
        }
    }
}
