//
//  Bundle-Decodable.swift
//  Moonshot8
//
//  Created by Armando Francisco on 11/7/24.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not read \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context){
            fatalError("Failed to decode \(file) from bundle due to missing key \(key.stringValue) in \(context.debugDescription)")
        } catch DecodingError.typeMismatch(let type, let context){
            fatalError("Failed to decode \(file) from bundle due to type mismatch for \(type) in \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let value, let context){
            fatalError("Failed to decode \(file) from bundle due to value not found for \(value) in \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(let context){
            fatalError("Failed to decode \(file) from bundle due to data corruption in \(context.debugDescription)")
        } catch {
            fatalError("Failed to decode \(file) from bundle due to \(error.localizedDescription)")
        }
    }
}
