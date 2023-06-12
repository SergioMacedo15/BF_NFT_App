//
//  UIView + Extensions.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 12/06/23.
//

import Foundation
import UIKit

extension UIView {
    
    func roundCorners(cornerRadiuns: Double,typeCorners: CACornerMask){
        self.layer.cornerRadius = CGFloat(cornerRadiuns)
        self.clipsToBounds = true
        self.layer.maskedCorners = typeCorners
    }
}
