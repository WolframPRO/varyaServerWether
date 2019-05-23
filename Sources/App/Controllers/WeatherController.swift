//
//  WeatherController.swift
//  App
//
//  Created by Владимир on 23/05/2019.
//

import Foundation
import Vapor

/// Controls basic CRUD operations with graduces.
final class WeatherController {
    /// Returns celsius from farenheit.
    func celsius(_ req: Request) throws -> String {
        guard let farenheit = req.query[Double.self, at: "farenheit"] else {
            throw Abort(.badRequest)
        }
        
        let num = (farenheit - 32.0)/1.8
        
        return "\(num) C°"
    }
    
    /// Returns farenheit from celsius.
    func farenheit(_ req: Request) throws -> String {
        guard let celsius = req.query[Double.self, at: "celsius"] else {
            throw Abort(.badRequest)
        }
        
        let num = celsius * 1.8 - 32.0
        
        return "\(num) F°"
    }

}
