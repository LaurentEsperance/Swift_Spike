//
//  nePasToucher.swift
//  tp
//
//  Created by Maxime Britto on 29/09/2016.
//  Copyright © 2016 mbritto. All rights reserved.
//

import Foundation
import Darwin

func readText() -> String {
    var text:String
    if let t = readLine() {
        text = t
    } else {
        text = ""
    }
    return text
}

func readInt() -> Int {
    var value:Int?
    repeat {
        value = Int(readText())
        if value == nil {
            print("Valeur incorrecte, une valeur entière est attendue")
        }
    } while value == nil
    return value!
}

func readDouble() -> Double {
    var value:Double?
    repeat {
        value = Double(readText())
        if value == nil {
            print("Valeur incorrecte, une valeur réelle est attendue")
        }
    } while value == nil
    return value!
}

func generateRandomNumber(min:Int, max:Int) -> Int {
    let range = max-min + 1
    return Int(arc4random_uniform(UInt32(range))) + min
}
