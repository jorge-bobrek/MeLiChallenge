//
//  Helpers.swift
//  MeLi Challenge
//
//  Created by Jorge Bobrek on 22/04/23.
//

import Foundation

extension Bundle {
    func fetchData<T: Decodable>(
        url: URL,
        model: T.Type,
        completion: @escaping (T) -> Void,
        failure: @escaping (Error) -> Void
    ) {
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                if let error = error {
                    failure(error)
                }
                return
            }
            do { let serverData = try JSONDecoder().decode(T.self, from: data)
                completion(serverData)
            } catch {
                failure(error)
            }
        }
        .resume()
    }
}

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        return formatter
    }()
}

extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}

func conditionText(_ condition: Condition) -> String {
    switch condition {
    case .new: return "Nuevo"
    case .used: return "Usado"
    }
}
