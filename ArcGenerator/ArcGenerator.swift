//
//  ArcGenerator.swift
//  ArcGenerator
//
//  Created by Jack Wu on 2014-12-09.
//  Copyright (c) 2014 Ray Wenderlich. All rights reserved.
//

import UIKit
import Darwin

let WatchSize38mm = CGSize(width: 272, height: 340)
let WatchSize42mm = CGSize(width: 312, height: 390)

public struct ArcParams {
    // MARK: Appearance
    public var radius: Int
    public var lineWidth: Int
    public var padding: Int
    public var startAngle: Double // 0 is rightmost, defaults to 3π/2, which is top
    public var clockwise: Bool
    
    public var color: UIColor
    
    // MARK: Meta
    public var name: String
    public var frameCount: Int
    public var scale:Int = 2 // Should not need changing (until new watches :])
    
    // MARK: Computed
    public var size: CGSize {
        let width = 2 * (radius + padding)
        return CGSize(width: width, height: width)
    }
    
    public var center: CGPoint {
        return CGPoint(x: radius + padding, y: radius + padding)
    }

    public init(radius: Int = Int(WatchSize38mm.width) - 20,
        lineWidth: Int = 6,
        padding: Int = 10,
        startAngle: Double = 3.0*M_PI/2.0,
        clockwise: Bool = true,
        color: UIColor = UIColor.whiteColor(),
        name: String = "frame",
        frameCount: Int = 360) {
            
        self.radius = radius * scale
        self.lineWidth = lineWidth * scale
        self.padding = padding * scale
        self.startAngle = startAngle
        self.clockwise = clockwise
        self.color = color
        self.name = name
        self.frameCount = frameCount
    }
    
}

public class ArcGenerator: NSObject {
    
    public func generateArcs(params: ArcParams) {
        prepareFolderForArc(params)
        
        let width = 2 * (params.radius + params.padding)
        let size = CGSize(width: width, height: width)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetStrokeColorWithColor(context, params.color.CGColor)
        
        for i in 0..<params.frameCount {
            let path = pathWithParams(params, index: i)
            path.stroke()
            let frame = UIGraphicsGetImageFromCurrentImageContext()
            saveFrameToDisk(frame, name: params.name, index: i)
        }
    
        UIGraphicsEndImageContext()
        println("Done generating Arc \"\(params.name)\" to path:")
        println(documentsPath.stringByAppendingPathComponent(params.name))
    }

    public func pathWithParams(params:ArcParams, index:Int) -> UIBezierPath {
        let deltaAngle = Double(index)/Double(params.frameCount) * 2.0 * M_PI
        let endAngle = params.clockwise ? params.startAngle + deltaAngle : params.startAngle - deltaAngle
        let path = UIBezierPath(arcCenter: params.center, radius: CGFloat(params.radius), startAngle: CGFloat(params.startAngle), endAngle: CGFloat(endAngle), clockwise: params.clockwise)
        
        path.lineWidth = CGFloat(params.lineWidth)
        path.lineCapStyle = kCGLineCapRound
        
        return path
    }
    
    public func saveFrameToDisk(frame: UIImage, name: String, index: Int) {
        let filename = name + String(index) + "@2x.png"
        let filePath = documentsPath.stringByAppendingPathComponent(name).stringByAppendingPathComponent(filename)
        UIImagePNGRepresentation(frame).writeToFile(filePath, atomically: true)
    }
    
    private func prepareFolderForArc(params: ArcParams) {
        let path = documentsPath.stringByAppendingPathComponent(params.name)
        NSFileManager.defaultManager().createDirectoryAtPath(path, withIntermediateDirectories: true, attributes: nil, error: nil)
    }
    
    private let documentsPath: String = {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        return paths.first as String
    }()
   
}
