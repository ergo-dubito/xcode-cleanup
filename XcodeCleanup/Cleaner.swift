//
//  Cleaner.swift
//  XcodeCleanup
//
//  Created by Brian Ramirez on 10/23/17.
//  Copyright © 2017 Brian Ramirez, All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation

class XcodeCleaner {
    func cleanup() {
        let homeDir = FileManager.default.homeDirectoryForCurrentUser
        
        /// Setup the URL Paths
        let archivePath = "Library/Developer/Xcode/Archives/"
        let derrivedDataPath = "Library/Developer/Xcode/DerivedData/"
        let archiveURL = homeDir.appendingPathComponent(archivePath, isDirectory: true)
        let derrivedDataURL = homeDir.appendingPathComponent(derrivedDataPath, isDirectory: true)
        
        /// Get the contents of the Archives Directory
        do {
            let archivedDataPaths = try? FileManager.default.contentsOfDirectory(at: archiveURL, includingPropertiesForKeys: [], options: .skipsHiddenFiles)
            let derrivedDataPaths = try? FileManager.default.contentsOfDirectory(at: derrivedDataURL, includingPropertiesForKeys: [], options: .skipsHiddenFiles)
            
            /// Delete the Archived Files
            if let archivedItems = archivedDataPaths {
                for (_, item) in archivedItems.enumerated() {
                    try? FileManager.default.removeItem(at: item)
                    print("Removing Item: \(item.absoluteString)")
                }
            }
            /// Delete the Derrived Data Files
            if let derrivedItems = derrivedDataPaths {
                for (_, item) in derrivedItems.enumerated() {
                    try? FileManager.default.removeItem(at: item)
                    print("Removing Item: \(item.absoluteString)")
                }
            }
        }
    }
}