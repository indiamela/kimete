//
//  Date+Extension.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/16.
//

import Foundation

let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()
