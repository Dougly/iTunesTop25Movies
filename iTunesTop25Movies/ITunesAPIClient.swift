//
//  ITunesAPIClient.swift
//  iTunesTop25Movies
//
//  Created by Douglas Galante on 6/9/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import Foundation

class ITunesAPIClient {
    
    class func getMovieInfo(fromURL string: String, completion: @escaping ([[String : Any]]) -> Void) {
        let url = URL(string: string)
        let session = URLSession.shared
        
        // If url is valid attemt to obtain JSON and pass serialized JSON to completion handler
        if let url = url {
            session.dataTask(with: url, completionHandler: { (data, response, error) in
                if let data = data {
                    do {
                        let responseJSON = try JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
                        let feed = responseJSON["feed"] as! [String: Any]
                        let entry = feed["entry"] as! [[String : Any]]
                        completion(entry)                        
                    } catch {
                        if let response = response {
                            print("Could not serialize data into JSON\nERROR: \(error)\nRESPONSE: \(response)")
                        }
                    }
                } else {
                    print("Data returned NIL when calling API")
                    completion([])
                }
            }).resume()
        }
    }
    
    
}
