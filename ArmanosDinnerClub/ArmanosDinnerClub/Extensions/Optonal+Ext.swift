//
//  Optonal+Ext.swift
//  ArmanosDinnerClub
//
//  Created by Stepanyan Arman  on 24.07.2021.
//

import Foundation

public extension Optional where Wrapped: Collection{
    var isNilOrEmpty: Bool{
        self?.isEmpty ?? true
    }
}
