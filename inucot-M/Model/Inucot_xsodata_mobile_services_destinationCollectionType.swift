//
// inucot-M
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 20/07/20
//

import Foundation

enum Inucot_xsodata_mobile_services_destinationCollectionType: String {
    case location = "Location"
    case visit = "Visit"
    case visitor = "Visitor"
    case none = ""
    static let all = [location, visit, visitor]
}
