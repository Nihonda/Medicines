//
//  IO.swift
//  Medicines
//
//  Created by Apple on 12/7/20.
//  Copyright © 2020 Nihonda. All rights reserved.
//

import Foundation

// https://stackoverflow.com/questions/24097826/read-and-write-a-string-from-text-file#answer-24098149
class IO {
    static func write(fileName: String, content: String) -> Bool {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

            let fileURL = dir.appendingPathComponent(fileName)

            //writing
            do {
                try content.write(to: fileURL, atomically: false, encoding: .utf8)
                print("=== Saved: \(fileName) ===")
                
                return true
            }
            catch {/* error handling here */
                print("Error writing file: \(fileURL), error: \(error.localizedDescription)")
            }
        }
        
        return false
    }
    
    static func read(fileName: String) -> String? {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

            let fileURL = dir.appendingPathComponent(fileName)

            //reading
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                return text
            }
            catch {/* error handling here */
                print("Reading file: \(fileURL), error: \(error.localizedDescription)")
            }
        }
        
        return nil
    }
    
    // https://stackoverflow.com/questions/24181699/how-to-check-if-a-file-exists-in-the-documents-directory-in-swift#answer-35775094
    static func exists(fileName: String) -> Bool {
        if let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
            let url = NSURL(fileURLWithPath: path)
            if let pathComponent = url.appendingPathComponent(fileName) {
                let filePath = pathComponent.path
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath) {
                    print("=== File: \(fileName) exists ===")
                    return true
                } else {
                    print("=== File: \(fileName) not available ===")
                }
            }
        } else {
            print("FILE PATH NOT AVAILABLE")
        }

        return false
    }
}
