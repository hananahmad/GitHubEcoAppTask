//
//  UIImageView+Kingfisher.swift
//  GitHubEcoAppTask
//
//  Created by Hanan on 11/28/19.
//  Copyright © 2019 HANAN. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(with url: URL?, placeholder: UIImage? = nil) {
        kf.setImage(with: url, placeholder: placeholder)
    }
    
    func cancelImageFetching() {
        kf.cancelDownloadTask()
    }
}

