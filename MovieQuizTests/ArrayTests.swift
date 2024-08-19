//
//  ArrayTests.swift
//  ArrayTests
//
//  Created by infurianto on 12.08.2024.
//

import XCTest
@testable import MovieQuiz

final class ArrayTests: XCTestCase {
    
    func testGetValueInRange() {
        // Given
        let array = [1, 2, 3, 4]
        
        //When
        let value = array[safe: 2]
        
        //Then
        XCTAssertNotNil(value)
        XCTAssertEqual(value, 3)
    }
    
    func testGetValueOutOfRange() {
        //Given
        let array = [1, 2, 3, 4]
        
        //When
        let value = array[safe: 11]
        
        //Then
        XCTAssertNil(value)
    }
}
