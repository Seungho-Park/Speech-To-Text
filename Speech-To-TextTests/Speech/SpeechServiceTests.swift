//
//  SpeechServiceTests.swift
//  Speech-To-TextTests
//
//  Created by 박승호 on 2023/09/10.
//

import XCTest

final class SpeechServiceTests: XCTestCase {
    func test_SpeechShouldReturnResponse() {
        var completionCallCount = 0
//        let config = SpeechConfig(locale: .current)
        
        let expectedValue = "하이~"
        let sut = DefaultSpeechService(recognizer: SpeechRecognizerMock(speechText: expectedValue, error: nil))
        
        sut.startRecording(request: SpeechRequest()) { result in
            do {
                let result = try result.get()
                
                XCTAssertEqual(result, expectedValue)
                completionCallCount += 1
            } catch {
                XCTFail("Error occured ...")
            }
        }
        
        XCTAssertEqual(completionCallCount, 1)
    }
    
    func test_SpeechShouldReturnFailure() {
        var completionCallCount = 0
//        let config = SpeechConfig(locale: .current)
        
        let expectedValue = "하이~"
        let sut = DefaultSpeechService(recognizer: SpeechRecognizerMock(speechText: expectedValue, error: SpeechServiceError.request(error: SpeechRecognizerError.nilRecognizer)))
        
        sut.startRecording(request: SpeechRequest()) { result in
            do {
                _ = try result.get()
                XCTFail("Result Success...")
            } catch {
                completionCallCount += 1
            }
        }
        
        XCTAssertEqual(completionCallCount, 1)
    }
}
