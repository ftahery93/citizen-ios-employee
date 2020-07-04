//
//  UITextView+Extension.swift
//  TG
//
//  Created by hardtask on 2/3/18.
//  Copyright © 2018 hardtask. All rights reserved.
//

import UIKit

extension Date {
    
    func numberOfDaysUntilDateTime(toDateTime: Date, calendar: Calendar) -> Int {
        let fromDate = calendar.startOfDay(for: self)
        let toDate = calendar.startOfDay(for: toDateTime)
        let difference = calendar.dateComponents([.day], from: fromDate, to: toDate)
        return difference.day!
    }
}
