//
//  RoundedShape.swift
//  Twitter
//
//  Created by Erislam Nurluyol on 21.08.2022.
//

import SwiftUI

struct RoundedShape: Shape {
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: self.corners,
                                cornerRadii: CGSize(width: 80, height: 80))
        return Path(path.cgPath)
    }
}
