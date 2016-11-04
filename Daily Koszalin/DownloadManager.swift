//
//  DownloadManager.swift
//  Daily Koszalin
//
//  Created by Adrian on 14.09.2016.
//  Copyright © 2016 Adrian Kubała. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class DownloadManager {
  static let sharedInstance = DownloadManager()
  fileprivate init() {}
  
  func downloadFavIcon(_ url: String?, completion: @escaping (UIImage?) -> ()) {
    guard var searchUrl = url else {
      return
    }
    
    searchUrl = "https://www.google.com/s2/favicons?domain=" + searchUrl
    Alamofire.request(.GET, searchUrl)
      .responseImage { response in
        
        let img = response.result.value
        completion(img)
    }
  }
}