# SNNetworkManager
[![swift-version](https://img.shields.io/badge/Swift-5.6-green)](https://github.com/apple/swift)

SNNetworkManager is an efficient, easy-to-use, and powerful api management platform, designed to provide more elegant interface management services for developers, products, and testers. It can help developers to easily create, publish, and maintain APIs. SNNetworkManager also provides users to customize the api services. Developers only need to use the manager class and called request as per requirement.


## Requirements 📝
* Swift 5.0+
* iOS 14.0+
* Xcode 12+

## Setup Manager
To install in project first you need to drag and drop the sources folder into your project. 

### Following Step
1. Enter your API key into info.plist (This steps only need if your webservice/api has need to pass key in Header).
```
<key>RESTAppKey</key>
<string>YOUR_API_KEY</string>
```

2. Set Base URL of your API
```
var baseUrl: URL {
     return URL(string: API.baseURL.rawValue)!
}

enum API: String {
    case baseURL = "https://YOUR_BASE_URL"
    case subURL = "SUB_URL"
}
```

3. If you have to add Authorization Bearer Token (Optional)

Add
```
SNNetworkManager.shared.setAuthToken(token: "YOUR_ACCESS_TOKEN")
```
Remove
```
SNNetworkManager.shared.removeAuthToken()
```

## Code
1. GET Request
```
SNNetworkManager.shared.requestGet(path: "YOUR_API_PATH", params: [YOUR: PARAMETER]) { (success, failure, statuscode) in
    if failure == nil {                
        print(success as Any)     
    } else {              
        print("Error: \(failure?.localizedDescription ?? "")\nStatusCode: \(statuscode)")  
    }      
}
```

2. POST Request

Here we can pass content type as "multipart/form-data", "application/x-www-form-urlencoded" and "application/json".
```
 SNNetworkManager.shared.requestPost(path: "YOUR_API_PATH", params: [YOUR: PARAMETER], contentType: .applicationJson) { (success, failure, statuscode) in 
    if failure == nil {
        print(success as Any)  
    } else {              
        print("Error: \(failure?.localizedDescription ?? "")\nStatusCode: \(statuscode)") 
    }    
 }
```

3. PUT Request

Here we can pass content type as "multipart/form-data", "application/x-www-form-urlencoded" and "application/json".
```
 SNNetworkManager.shared.requestPut(path: "YOUR_API_PATH", params: [YOUR: PARAMETER], contentType: .applicationJson) { (success, failure, statuscode) in 
    if failure == nil {
        print(success as Any)  
    } else {              
        print("Error: \(failure?.localizedDescription ?? "")\nStatusCode: \(statuscode)") 
    }    
 }
```

4. Delete Request
```
 SNNetworkManager.shared.requestDelete(path: "YOUR_API_PATH", params: [YOUR: PARAMETER]) { (success, failure, statuscode) in
    if failure == nil {                
        print(success as Any)     
    } else {              
        print("Error: \(failure?.localizedDescription ?? "")\nStatusCode: \(statuscode)")  
    }      
}
```

5. Upload Images
```
let imageData = UIImage(named: "YOUR IMAGE")?.jpegData(compressionQuality: 1)
        
let param = ["id": "123",
             "image": imageData] as [String : Any]
        
SNNetworkManager.shared.requestUploadImage(path: API.all.rawValue, params: param, contentType: .formData) { success, failure, statuscode in
       if failure == nil {
            print(success as Any)
       } else {
            print("Error: \(failure?.localizedDescription ?? "")\nStatusCode: \(statuscode)")
       }
 }
```

## Contact Us
For any query feel free to connect at [contact@softnoesis.com](mailto:contact@softnoesis.com).

