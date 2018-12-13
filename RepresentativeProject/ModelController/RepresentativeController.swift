//
//  RepresentativeController.swift
//  RepresentativeProject
//
//  Created by Brady Bentley on 12/13/18.
//  Copyright © 2018 Brady. All rights reserved.
//

import Foundation

class RepresentativeController {
    // MARK: - Properties
    static var baseUrl = URL(string: "https://whoismyrepresentative.com")
    
    // MARK: - Fetching
    //https://whoismyrepresentative.com/getall_reps_bystate.php?state=CA&output=json
    static func searchRepresentatives(forState state: String, completion: @escaping ([Representative]) -> Void) {
        guard var url = baseUrl else { completion([]) ; return }
        url.appendPathComponent("getall_reps_bystate")
        url.appendPathExtension("php")
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let stateQueryItem = URLQueryItem(name: "state", value: state)
        let outputQueryItem = URLQueryItem(name: "output", value: "json")
        components?.queryItems = [stateQueryItem, outputQueryItem]
        guard let requestUrl = components?.url else { completion([]) ; return }
        print(requestUrl.absoluteString)
       
        var request = URLRequest(url: requestUrl)
        request.httpBody = nil
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("❌Error with dataTask: \(error.localizedDescription)")
                completion([])
                return
            }
            guard let data = data, let responseDataString = String(data: data, encoding: .ascii), let fixedData = responseDataString.data(using: .utf8) else { completion([]) ; return }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let topLevelDictionary = try jsonDecoder.decode(TopLevelDictionary.self, from: fixedData)
                let representatives = topLevelDictionary.results
                completion(representatives)
            } catch {
                print("❌Error decoding data: \(error.localizedDescription)")
                completion([])
                return
            }
        }.resume()
    }
}
