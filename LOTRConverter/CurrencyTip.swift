//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Jenil Jariwala on 2024-03-17.
//

import Foundation
import TipKit

struct CurrencyTip: Tip{
    var title = Text("Change Currency")
    
    var message: Text? = Text("You can Tap left or right currency to bring up the select currency screen")
    
}
