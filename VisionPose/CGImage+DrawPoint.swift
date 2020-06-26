//
//  CGImage+DrawPoint.swift
//  VisionPose
//
//  Created by Albert on 6/25/20.
//

import Foundation
import CoreGraphics
import UIKit
extension CGImage {
    func drawPoints(points:[CGPoint]) -> UIImage? {
        
        let cntx = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: bitsPerComponent , bytesPerRow: 0, space: colorSpace ?? CGColorSpaceCreateDeviceRGB(), bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)
        
        cntx?.draw(self, in: CGRect(x: 0, y: 0, width: width, height: height))
        for point in points {
            cntx?.setFillColor(red: 0, green: 1, blue: 0, alpha: 1)
            cntx?.addArc(center: point, radius: 4, startAngle: 0, endAngle: CGFloat(2*Double.pi), clockwise: false)
            cntx?.drawPath(using: .fill)
        }
        let _cgim = cntx?.makeImage()
        if let cgi = _cgim {
            let img = UIImage(cgImage: cgi)
            return img
        }
        return nil
    }
}
