//
//  ContentView.swift
//  StringButcher
//
//  Created by Nicky Taylor on 5/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            
            //SEG.process()
            //return;
            
            
            let stringButcher = StringButcher()
            
            let lines = """
gyroscope_enabled
auto_loop_enabled
record_audio_enabled
stereoscopic_enabled
animation_jiggle_apply_to_all
animation_bounce_apply_to_all
animation_twist_apply_to_all
animation_wobble_apply_to_all
"""
            
            let format =
"""
import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func get\(StringButcher.symbolCamelUpper)SexyCheckBoxToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxText\(StringButcher.symbolCamelUpper)Line1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxText\(StringButcher.symbolCamelUpper)Line2()
        let iconPack = FramedConvertibleIconLibrary.menuB
        
        let configuration = ToolInterfaceElementSexyCheckBoxConfiguration(iconPack: iconPack,
                                                                          orientation: orientation,
                                                                          nameLabelLine1: textLine1,
                                                                          nameLabelLine2: textLine2)
        
        let flex = Self.getSexyCheckBoxFlex(orientation: orientation,
                                            configuration: configuration,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        
        let viewModel\(StringButcher.symbolCamelUpper) = MagicalSexyCheckBoxViewModel\(StringButcher.symbolCamelUpper)(orientation: orientation,
                                                                               sexyCheckBoxConfiguration: configuration)
        let \(StringButcher.symbolCamelLower)ToolNode = ToolNode(id: getToolNodeID(),
                                             element: .sexyCheckBox\(StringButcher.symbolCamelUpper),
                                             flex: flex,
                                             magicalViewModel: viewModel\(StringButcher.symbolCamelUpper),
                                             neighborTypeLeft: neighborTypeLeft,
                                             neighborTypeRight: neighborTypeRight)
        viewModel\(StringButcher.symbolCamelUpper).refresh()
        return \(StringButcher.symbolCamelLower)ToolNode
    }
}


"""
            
            
            
            stringButcher.butcher(lines: lines,
                                  format: format)
            
        }
    }
}
