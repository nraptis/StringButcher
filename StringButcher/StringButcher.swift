//
//  StringButcher.swift
//  StringButcher
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

class StringButcher {
    
    static let symbolOriginal = "{o}"
    static let symbolCamelLower = "{cl}"
    static let symbolCamelUpper = "{cu}"
    
    struct Line {
        let original: String
        let camelLower: String
        let camelUpper: String
    }
    
    func camelToSnakePrintLines(_ lines: String) {
        let __lines = lines.split(separator: "\n").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }.filter { $0.count > 0 }
        for line in __lines {
            let snake = camelToSnake(line)
            print(snake)
        }
        
    }
    
    func camelToSnake(_ string: String) -> String {
    
        let letters = Array(string)
        let lettersLower = Array(string.lowercased())
        var resultArray = [Character]()
        for letterIndex in letters.indices {
            let letter = letters[letterIndex]
            let letterLower = lettersLower[letterIndex]
            if letter.isUppercase {
                if (letterIndex != (letters.count - 1)) && (letterIndex != (0)) {
                    resultArray.append("_")
                }
            }
            resultArray.append(letterLower)
        }
        return String(resultArray)
    }
    
    func butcher(lines: String, format: String) {
        
        let __lines = lines.split(separator: "\n").sorted().map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }.filter { $0.count > 0 }
        
        var lines = [Line]()
        
        for __line in __lines {
            
            let words = __line.split(separator: "_")
                //.dropLast(2)
            
            var resultOriginal = [String]()
            var resultCamelLower = [String]()
            var resultCamelUpper = [String]()
            
            for wordIndex in 0..<words.count {
                let word = String(words[wordIndex])
                let capitalized = word.capitalized
                
                resultOriginal.append(word)
                if wordIndex == 0 {
                    resultCamelLower.append(word)
                } else {
                    resultCamelLower.append(capitalized)
                }
                resultCamelUpper.append(capitalized)
            }
            
            if resultOriginal.count > 0 && resultCamelLower.count > 0 && resultCamelUpper.count > 0 {
                let original = resultOriginal.joined(separator: "_")
                let camelLower = resultCamelLower.joined()
                let camelUpper = resultCamelUpper.joined()
                let line = Line(original: original,
                                camelLower: camelLower,
                                camelUpper: camelUpper)
                lines.append(line)

            }
            
            
        }
        
        butcher(lines: lines, format: format)
        
    }
    
    func butcher(lines: [Line], format: String) {
        
        //for line in lines {
        //    print(line)
        //}
        
        for line in lines {
            
            var string = format
            string = string.replacingOccurrences(of: Self.symbolOriginal, with: line.original)
            string = string.replacingOccurrences(of: Self.symbolCamelLower, with: line.camelLower)
            string = string.replacingOccurrences(of: Self.symbolCamelUpper, with: line.camelUpper)
            
            
            print(string)
            
        }
        
        
        
    }
    
    
    
}
