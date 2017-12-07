//
//  ImageDisplayable.swift
//  ImageDisplayable
//
//  Created by Chandler De Angelis on 12/6/17.
//  Copyright © 2017 Chandler De Angelis. All rights reserved.
//

import Foundation
import UIKit

public typealias ImageDisplayableCompletion = (UIImage?, Error?) -> Void

public enum ImageDisplayableError: Error {
    case unexpectedMimeType
}

public protocol ImageDisplayable {
    
    var imageSession: URLSession { get set }
    var expectedMimeTypes: [String] { get }
    func download(at url: URL, completion: @escaping ImageDisplayableCompletion)
}

extension ImageDisplayable {
    
    public var expectedMimeTypes: [String] {
        return [
            "image/png",
            "image/jpeg"
        ]
    }
    
    public func download(at url: URL, completion: @escaping ImageDisplayableCompletion) {
        let task: URLSessionTask = self.imageSession.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if let mimeType: String = response?.mimeType, !self.expectedMimeTypes.contains(mimeType) {
                DispatchQueue.main.async {
                    completion(nil, ImageDisplayableError.unexpectedMimeType)
                }
            } else if let unwrappedData: Data = data, unwrappedData.count > 0, error == nil {
                let image: UIImage? = UIImage(data: unwrappedData)
                DispatchQueue.main.async {
                    completion(image, nil)
                }
            } else if let unwrappedError: Error = error {
                DispatchQueue.main.async {
                    completion(nil, unwrappedError)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil, nil)
                }
            }
        }
        task.resume()
    }
}
