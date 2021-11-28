//
//  MockResponse.swift
//  MerchandisingTests
//
//  Created by Poonam on 28/11/21.
//

import Foundation
@testable import Merchandising

class MockResponse {
    
    func testFetchProductList() -> [ProductModel] {
        let url = Bundle.main.url(forResource: "Response", withExtension: "json")!
        do {
            let data = (try? Data(contentsOf: url))!
            let parsedResponse = try? JSONDecoder().decode(ResultModel.self, from: data)
            return parsedResponse!.results
        }
    }
}
