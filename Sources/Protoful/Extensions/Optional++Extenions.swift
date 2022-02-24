//
//  Optional++Extensions.swift
//  Protoful
//  
//
//  Created by Kiarash Vosough on 1/17/22.
//
//
//  Copyright 2022 KiarashVosough and other contributors
//
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the
//  Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to
//  the following conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import Foundation

public extension Optional {
    
    enum OptionalError: Error {
        case Nil
        case callBackNil
    }
    
    /// Returns a Bool value  for `nil` value
    var isNil:Bool {
        return self == nil
    }
    
    var isNotNil:Bool {
        return self != nil
    }
    
    /// Returns the wrapped value that satisfy predicate otherwise return`nil`
    func matching(_ predicate: (Wrapped) -> Bool) -> Wrapped? {
        guard let value = self else {
            return nil
        }
        
        guard predicate(value) else {
            return nil
        }
        
        return value
    }
    
    /// Returns the wrapped value or crashes with `fatalError(message)`
    func expect(_ message: String) throws -> Wrapped {
        #if DEBUG
        guard let value = self else {
            if NSClassFromString("XCTest") != nil {
                throw OptionalError.Nil
            }
            fatalError(message)
        }
        #else
        guard let value = self else { throw OptionalError.Nil }
        #endif
        return value
    }
    
    /// Execute some closure if optionsl is not`nil`
    func on(some: () throws -> Void) rethrows {
        if self != nil { try some() }
    }
    
    func onValue(_ some: (Wrapped) throws -> Void) rethrows {
        if self != nil { try some(self!) }
    }
    
    func map<T>(some: (Wrapped) throws -> T?) rethrows -> T? {
        if self != nil { return try some(self!) }
        else { return nil }
    }
    
    /// Execute `some` closure if optionsl is not`nil` otherwise executes `none`
    func onValue(some: (Wrapped) throws -> Void, none: () throws -> Void) rethrows {
        if let self = self { try some(self) }
        else { try none() }
    }
    
    /// Execute `some` closure if optionsl is not`nil` otherwise executes `none`
    func filterMap<T>(some: (Wrapped) throws -> T, none: () throws -> T) rethrows -> T {
        if let self = self { return try some(self) }
        else { return try none() }
    }
    
    /// Executes the closure `none` if and only if the optional has no value
    func onAbsence(_ none: () throws -> Void) rethrows {
        if self == nil { try none() }
    }
    
    /// Return the value of the Optional or the `default` parameter
    /// - param: The value to return if the optional is empty
    func or(_ default: Wrapped) -> Wrapped {
        return self ?? `default`
    }
    
    /// Returns the unwrapped value of the optional *or*
    /// the result of an expression `else`
    /// I.e. optional.or(else: print("Arrr"))
    func or(else: @autoclosure () -> Wrapped) -> Wrapped {
        return self ?? `else`()
    }
    
    /// Returns the unwrapped value of the optional *or*
    /// the result of calling the closure `else`
    /// I.e. optional.or(else: {
    /// ... do a lot of stuff
    /// })
    func or(else: () -> Wrapped) -> Wrapped {
        return self ?? `else`()
    }
    
    /// Returns the unwrapped contents of the optional if it is not empty
    /// If it is empty, throws exception `throw`
    func or(throw exception: Error) throws -> Wrapped {
        guard let unwrapped = self else { throw exception }
        return unwrapped
    }
    
    mutating func toggleNil() {
        self = nil
    }
}
