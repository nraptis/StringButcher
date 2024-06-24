//
//  SegmentNamer.swift
//  StringButcher
//
//  Created by Nicky Taylor on 5/7/24.
//

import Foundation

class SegmentNamer {
    
    let master: String
    let modes: [String]
    let type: String
    
    init(master: String, type: String, modes: [String]) {
        self.master = master
        self.type = type
        self.modes = modes
    }
}

class Mode {
    let button: VariableNameWords
    let mode: VariableNameWords
    
    let textLine1: String
    let textLine2: String
    
    let textFunctionName1: String
    let textFunctionName2: String
    
    
    init(button: VariableNameWords, mode: VariableNameWords) {
        self.button = button
        self.mode = mode
        
        textLine1 = button.snake + "_line_1"
        textLine2 = button.snake + "_line_2"
        
        textFunctionName1 = "segmentText" + button.upper + "Line1"
        textFunctionName2 = "segmentText" + button.upper + "Line2"
    }
}

class Segment {
    
    let name: VariableNameWords
    let modes: [Mode]
    
    var viewModelName: String {
        "MagicalSegmentedPickerViewModel\(name.upper)"
    }
    
    init(segmentNamer: SegmentNamer) {
        
        let _master = segmentNamer.master
        
        
        name = StringUtils.chop([_master])
        
        var _modes = [Mode]()
        for mode in segmentNamer.modes {
            let button = StringUtils.chop([_master, mode])
            
            let mode = StringUtils.chop([mode])
            
            _modes.append(Mode(button: button, mode: mode))
        }
        self.modes = _modes
    }
}


class SEG {
    
    static let symbolCamel = "{cl}"
    static let symbolUpper = "{cu}"
    
    static let symbolModeCamel = "{mcl}"
    static let symbolModeUpper = "{mcu}"
    
    
    static let symbolViewModel = "{vm}"
    
    
    static let symbolLine1 = "{l1}"
    static let symbolLine2 = "{l2}"
    
    static let symbolTextFunctionName1 = "{tf1}"
    static let symbolTextFunctionName2 = "{tf2}"
    
    
    
    static func process() {
        
        var segments = [Segment]()
        
        for segmentNamer in segmentNamers {
            
            let segment = Segment(segmentNamer: segmentNamer)
            segments.append(segment)
            
            /*
            static func segmentTextBreakTangentPointLine1() -> String? {
                GeneralStringLibrary.stringOrNull(String(localized: "break_tangent_point_line_1", table: "ToolInterfaceSegments"))
            }
                
            static func segmentTextBreakTangentPointLine2() -> String? {
                GeneralStringLibrary.stringOrNull(String(localized: "break_tangent_point_line_2", table: "ToolInterfaceSegments"))
            }
            */
        }
        
        /*
        for segment in segments {
            for mode in segment.modes {
                let text =
"""

static func \(Self.symbolTextFunctionName1)() -> String? {
    GeneralStringLibrary.stringOrNull(String(localized: "\(Self.symbolLine1)", table: "ToolInterfaceSegments"))
}
    
static func \(Self.symbolTextFunctionName2)() -> String? {
    GeneralStringLibrary.stringOrNull(String(localized: "\(Self.symbolLine2)", table: "ToolInterfaceSegments"))
}

"""
                
                let output = _format(text: text, segment: segment, mode: mode)
                print(output)
                
            }
        }
        */
        
        /*
        for segment in segments {
         
            let text =
"""
        \(Self.symbolViewModel)
"""
            let output = _format(text: text, segment: segment)
            print(output)
         }
         */
        
        
        for segment in segments {
            
            var text =
"""
extension ToolInterfaceViewModel {
    
    func get\(Self.symbolUpper)SegmentToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        var buttonConfigurations = [ToolInterfaceElementSegmentedPickerButtonConfiguration]()
        

"""
            
            text = Self._format(text: text, segment: segment)
            text += "\n"
            
            for modeIndex in 0..<segment.modes.count {
                let mode = segment.modes[modeIndex]
                
                var snippet = """
let \(Self.symbolModeCamel)TextIconImagePack = ToolInterfaceImageLibrary.iconPackMainMenu
        let \(Self.symbolModeCamel)Line1 = ToolInterfaceStringLibrarySegments.\(Self.symbolTextFunctionName1)()
        let \(Self.symbolModeCamel)Line2 = ToolInterfaceStringLibrarySegments.\(Self.symbolTextFunctionName2)()
        let \(Self.symbolModeCamel)Configuration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: \(modeIndex),
                                                                                           textIconImagePack: \(Self.symbolModeCamel)TextIconImagePack,
                                                                                           orientation: orientation,
                                                                                           nameLabelLine1: \(Self.symbolModeCamel)Line1,
                                                                                           nameLabelLine2: \(Self.symbolModeCamel)Line2)
        buttonConfigurations.append(\(Self.symbolModeCamel)Configuration)
        
"""
                snippet = Self._format(text: snippet, segment: segment, mode: mode)
                text += snippet
                text += "\n"
            }
            
            text +=
"""
let configuration = ToolInterfaceElementSegmentedPickerConfiguration(buttonConfigurations: buttonConfigurations)
        
        
        let flex = Self.getSegmentFlex(orientation: orientation,
                                       configuration: configuration,
                                       neighborTypeLeft: neighborTypeLeft,
                                       neighborTypeRight: neighborTypeRight)
        let viewModel\(Self.symbolUpper) = \(Self.symbolViewModel)(jiggleViewModel: jiggleViewModel,
                                                                                toolInterfaceViewModel: self,
                                                                                segmentedPickerConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .segment\(Self.symbolUpper),
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModel\(Self.symbolUpper),
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
                viewModel\(Self.symbolUpper).refresh()
        return result
    }
}
"""
            
            let output = _format(text: text, segment: segment)
            print(output)
            
        }
        
        
    }
    
    
    
    static func _format(text: String, segment: Segment, mode: Mode) -> String {
        
        //for line in lines {
        //    print(line)
        //}

        var text = _format(text: text, segment: segment)
        text = text.replacingOccurrences(of: Self.symbolLine1, with: mode.textLine1)
        text = text.replacingOccurrences(of: Self.symbolLine2, with: mode.textLine2)
        text = text.replacingOccurrences(of: Self.symbolTextFunctionName1, with: mode.textFunctionName1)
        text = text.replacingOccurrences(of: Self.symbolTextFunctionName2, with: mode.textFunctionName2)
        
        text = text.replacingOccurrences(of: Self.symbolModeCamel, with: mode.mode.camel)
        text = text.replacingOccurrences(of: Self.symbolModeUpper, with: mode.mode.upper)
        
        
        return text
    }
    
    static func _format(text: String, segment: Segment) -> String {
        
        //for line in lines {
        //    print(line)
        //}

        var text = text
        text = text.replacingOccurrences(of: Self.symbolCamel, with: segment.name.camel)
        text = text.replacingOccurrences(of: Self.symbolUpper, with: segment.name.upper)
        text = text.replacingOccurrences(of: Self.symbolViewModel, with: segment.viewModelName)
        
        
        return text
    }
    
}
