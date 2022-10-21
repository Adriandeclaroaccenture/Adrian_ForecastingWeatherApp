//
//  FileManager+Extension.swift
//  ForecastingWeather
//
//  Created by john.adrian.de.claro on 10/20/22.
//

import Foundation

let filename = "Weather.json"

extension FileManager {
    static var docDirURL: URL {
        return Self.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
//MARK: - Save Document
    func saveDocument(contents: String, docName: String, completion:(Error?) -> Void) {
        let url = Self.docDirURL.appendingPathComponent(docName)
        do {
            try contents.write(to: url, atomically: true, encoding: .utf8)
        } catch {
            completion(error)
        }
    }
//MARK: - Read Document
    func readDocument(docName: String, completion: (Result <Data, Error> ) -> Void) {
        let url = Self.docDirURL.appendingPathComponent(docName)
        do {
            let data = try Data(contentsOf: url)
            completion(.success(data))
        } catch  {
            completion(.failure(error))
        }
    }
//MARK: - Document Exist
    func docExist(named docName: String) -> Bool {
        fileExists(atPath: Self.docDirURL.appendingPathComponent(docName).path)
    }
}