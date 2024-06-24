//
//  StringUtils.swift
//  StringButcher
//
//  Created by Nicky Taylor on 5/7/24.
//

import Foundation

struct VariableNameFormat {
    let snake: String
    let camel: String
    let upper: String
}

struct VariableNameWords {
    var words: [String]
    
    var snake: String {
        StringUtils.getSnake(self)
    }
    
    var camel: String {
        StringUtils.getCamel(self)
    }
    
    var upper: String {
        StringUtils.getUpper(self)
    }
    
}

struct StringUtils {
    
    static func chop(_ items: [String]) -> VariableNameWords {
        var words = [String]()
        for item in items {
            let _variableNameWords = chop(item)
            for _word in _variableNameWords.words {
                words.append(_word)
            }
        }
        return VariableNameWords(words: words)
    }
    
    static func chop(_ item: String) -> VariableNameWords {
        let words = item.split(separator: "_")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { $0.count > 0 }
        return VariableNameWords(words: words)
    }
    
    static func getSnake(_ variableNameWords: VariableNameWords) -> String {
        return variableNameWords.words.joined(separator: "_")
    }
    
    static func getCamel(_ variableNameWords: VariableNameWords) -> String {
        var list = [String]()
        for wordIndex in 0..<variableNameWords.words.count {
            let word = String(variableNameWords.words[wordIndex])
            let capitalized = word.capitalized
            if wordIndex == 0 {
                list.append(word)
            } else {
                list.append(capitalized)
            }
        }
        
        return list.joined()
    }
    
    static func getUpper(_ variableNameWords: VariableNameWords) -> String {
        var list = [String]()
        for wordIndex in 0..<variableNameWords.words.count {
            let word = String(variableNameWords.words[wordIndex])
            let capitalized = word.capitalized
            list.append(capitalized)
        }
        return list.joined()
    }
}
