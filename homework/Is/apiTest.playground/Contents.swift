import Foundation

enum Custom {
    static let KEY = "재발급함..:)"
    static let CATEGORY_CODE = "CE7"
    static let RADIUS = "200"
    static let Longitude = "126.97806"
    static let Latitude = "37.567"
}

enum BaseURL {
    static let base = "https://dapi.kakao.com/v2/local/search"
    static let 카테고리로_찾기 = base + "/category.json"
    static let 주소_검색하기 = base + "/address.json"
    static let 키워드로_찾기 = base + "/keyword.json"
}

func searchLocationsByCategory() {
    let baseURL = BaseURL.카테고리로_찾기
    let KEY = Custom.KEY
    guard let url = URL(string: baseURL) else { return }
    let newUrl = url.appending(queryItems: [
        URLQueryItem(name: "category_group_code", value: Custom.CATEGORY_CODE),
        URLQueryItem(name: "radius", value: Custom.RADIUS),
        URLQueryItem(name: "x", value: Custom.Longitude),
        URLQueryItem(name: "y", value: Custom.Latitude)
    ])
    var request = URLRequest(url: newUrl)
    request.httpMethod = "GET"
    request.setValue("dapi.kakao.com", forHTTPHeaderField: "Host")
    request.setValue("KakaoAK \(KEY)", forHTTPHeaderField: "Authorization")
    dump(request)
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard error == nil else {
            print("Error hi!")
            return
        }
        guard let data = data,
              let output = try? JSONDecoder().decode(Response.self, from: data) else {
            print("JSON Error")
            return
        }

        dump(output)
    }
    task.resume()
}

searchLocationsByCategory()







struct Response: Codable {
    let meta: Meta
    let documents: [Document]
}

struct Document: Codable {
    let placeName, distance: String
    let placeURL: String
    let categoryName, addressName, roadAddressName, id: String
    let phone, categoryGroupCode, categoryGroupName, x: String
    let y: String

    enum CodingKeys: String, CodingKey {
        case placeName = "place_name"
        case distance
        case placeURL = "place_url"
        case categoryName = "category_name"
        case addressName = "address_name"
        case roadAddressName = "road_address_name"
        case id, phone
        case categoryGroupCode = "category_group_code"
        case categoryGroupName = "category_group_name"
        case x, y
    }
}

// MARK: - Meta
struct Meta: Codable {
    let sameName: JSONNull?
    let pageableCount, totalCount: Int
    let isEnd: Bool

    enum CodingKeys: String, CodingKey {
        case sameName = "same_name"
        case pageableCount = "pageable_count"
        case totalCount = "total_count"
        case isEnd = "is_end"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}


var a = [10]
a = []
a.removeFirst()
