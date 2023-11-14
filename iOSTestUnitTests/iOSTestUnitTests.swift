//
//  iOSTestUnitTests.swift
//  iOSTestUnitTests
//
//  Created by Ponthota, Viswanath Reddy (Cognizant) on 14/11/23.
//

import XCTest

@testable import iOSTest

final class iOSTestUnitTests: XCTestCase {

    var sut: ContentListViewModel!
        
        override func setUpWithError() throws {
            // Put setup code here. This method is called before the invocation of each test method in the class.
            sut = ContentListViewModel(apiService: MockServiceClient())
        }

        override func tearDownWithError() throws {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
        }

        func testItemsEmpty() throws {
            XCTAssertNil(sut.items)
        }
        
        func testItemsAfterAPIResponse() throws {
           
            Task{
                await sut.getEarthQuakeData()
                XCTAssertNotNil(sut.items)
                
                let items = try XCTUnwrap(sut.items)
                
                XCTAssertEqual(items.count, 1)
            }
        }
        
    }

    class MockServiceClient: APIService {
        func request<T>(urlString: String, responseType: T.Type) async throws -> T where T : Decodable {
           
            let property = Property(mag: 6.5, place: "Swindon")
            let features = [Feature(type: "type1", properties: property, id: "1334")]
            return Response(features: features) as! T
        }
        
    }
