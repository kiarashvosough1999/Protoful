//
//  File.swift
//  
//
//  Created by Kiarash Vosough on 1/15/22.
//

import Foundation
@testable import Protoful

class parentTestCastableMock: Castable {
    var testNumbder = 10
}

final class childTestCastableMock: parentTestCastableMock {}

struct TestCastableMockNonRefrence: Castable {}
