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

jiggle_fill_dark_0
jiggle_fill_dark_1
jiggle_fill_dark_2
jiggle_fill_dark_3
jiggle_fill_dark_4
jiggle_fill_dark_5
jiggle_fill_dark_6
jiggle_fill_light_0
jiggle_fill_light_1
jiggle_fill_light_2
jiggle_fill_light_3
jiggle_fill_light_4
jiggle_fill_light_5
jiggle_fill_light_6
outline_selected_fill_dark
outline_selected_fill_light
outline_selected_stroke_dark
outline_selected_stroke_light
outline_unselected_fill_dark
outline_unselected_fill_light
outline_unselected_stroke_dark
outline_unselected_stroke_light
point_selected_outline_dark
point_selected_outline_light
point_weight_selected_1_dark_1
point_weight_selected_1_light_1
point_weight_selected_2_dark_1
point_weight_selected_2_dark_2
point_weight_selected_2_light_1
point_weight_selected_2_light_2
point_weight_selected_3_dark_1
point_weight_selected_3_dark_2
point_weight_selected_3_dark_3
point_weight_selected_3_light_1
point_weight_selected_3_light_2
point_weight_selected_3_light_3
point_weight_selected_4_dark_1
point_weight_selected_4_dark_2
point_weight_selected_4_dark_3
point_weight_selected_4_dark_4
point_weight_selected_4_light_1
point_weight_selected_4_light_2
point_weight_selected_4_light_3
point_weight_selected_4_light_4
point_weight_selected_5_dark_1
point_weight_selected_5_dark_2
point_weight_selected_5_dark_3
point_weight_selected_5_dark_4
point_weight_selected_5_dark_5
point_weight_selected_5_light_1
point_weight_selected_5_light_2
point_weight_selected_5_light_3
point_weight_selected_5_light_4
point_weight_selected_5_light_5
weight_ring_selected_1_dark_1
weight_ring_selected_1_light_1
weight_ring_selected_2_dark_1
weight_ring_selected_2_dark_2
weight_ring_selected_2_light_1
weight_ring_selected_2_light_2
weight_ring_selected_3_dark_1
weight_ring_selected_3_dark_2
weight_ring_selected_3_dark_3
weight_ring_selected_3_light_1
weight_ring_selected_3_light_2
weight_ring_selected_3_light_3
weight_ring_selected_4_dark_1
weight_ring_selected_4_dark_2
weight_ring_selected_4_dark_3
weight_ring_selected_4_dark_4
weight_ring_selected_4_light_1
weight_ring_selected_4_light_2
weight_ring_selected_4_light_3
weight_ring_selected_4_light_4
weight_ring_selected_5_dark_1
weight_ring_selected_5_dark_2
weight_ring_selected_5_dark_3
weight_ring_selected_5_dark_4
weight_ring_selected_5_dark_5
weight_ring_selected_5_light_1
weight_ring_selected_5_light_2
weight_ring_selected_5_light_3
weight_ring_selected_5_light_4
weight_ring_selected_5_light_5
weight_ring_selected_center_marker_dark
weight_ring_selected_center_marker_light
weight_ring_unselected_1_dark_1
weight_ring_unselected_1_light_1
weight_ring_unselected_2_dark_1
weight_ring_unselected_2_dark_2
weight_ring_unselected_2_light_1
weight_ring_unselected_2_light_2
weight_ring_unselected_3_dark_1
weight_ring_unselected_3_dark_2
weight_ring_unselected_3_dark_3
weight_ring_unselected_3_light_1
weight_ring_unselected_3_light_2
weight_ring_unselected_3_light_3
weight_ring_unselected_4_dark_1
weight_ring_unselected_4_dark_2
weight_ring_unselected_4_dark_3
weight_ring_unselected_4_dark_4
weight_ring_unselected_4_light_1
weight_ring_unselected_4_light_2
weight_ring_unselected_4_light_3
weight_ring_unselected_4_light_4
weight_ring_unselected_5_dark_1
weight_ring_unselected_5_dark_2
weight_ring_unselected_5_dark_3
weight_ring_unselected_5_dark_4
weight_ring_unselected_5_dark_5
weight_ring_unselected_5_light_1
weight_ring_unselected_5_light_2
weight_ring_unselected_5_light_3
weight_ring_unselected_5_light_4
weight_ring_unselected_5_light_5
weight_ring_unselected_center_marker_dark
weight_ring_unselected_center_marker_light
"""
            
            
            let format =
"""
static let _\(StringButcher.symbolCamelLower) = UIColor(named: "\(StringButcher.symbolOriginal)") ?? UIColor()
"""
            
            /*
             let format =
 """
     static let \(StringButcher.symbolCamelLower) = RGBA(uiColor: _\(StringButcher.symbolCamelLower))
 """
             */
            
            
            /*
            let format = """
static func checkBoxText\(StringButcher.symbolCamelUpper)Line1() -> String? {
    GeneralStringLibrary.stringOrNull(String(localized: "\(StringButcher.symbolOriginal)_line_1", table: "ToolInterfaceCheckBoxes"))
}
    
static func checkBoxText\(StringButcher.symbolCamelUpper)Line2() -> String? {
    GeneralStringLibrary.stringOrNull(String(localized: "\(StringButcher.symbolOriginal)_line_2", table: "ToolInterfaceCheckBoxes"))
}

"""
            */
            
            stringButcher.butcher(lines: lines,
                                  format: format)
            
            
            /*
            let format =
"""
func toolAction\(StringButcher.symbolCamelUpper)() {
    print("[IMB] Action - \(StringButcher.symbolCamelUpper)")
}
"""
             */
            
             /*
            let format = """
import Foundation

@Observable class MagicalTextIconButtonViewModel\(StringButcher.symbolCamelUpper): MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolAction\(StringButcher.symbolCamelUpper)()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModel\(StringButcher.symbolCamelUpper) (Dealloc)")
    }
}

"""
            */
            
            /*
            let format =
"""
extension ToolInterfaceViewModel {
    
    func get\(StringButcher.symbolCamelUpper)TextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonText\(StringButcher.symbolCamelUpper)Line1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonText\(StringButcher.symbolCamelUpper)Line2()
        let textIconImagePack = ToolInterfaceImageLibrary.iconPackMainMenu
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(textIconImagePack: textIconImagePack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModel\(StringButcher.symbolCamelUpper) = MagicalTextIconButtonViewModel\(StringButcher.symbolCamelUpper)(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let \(StringButcher.symbolCamelLower)ToolNode = ToolNode(id: getToolNodeID(), element: .textIconButton\(StringButcher.symbolCamelUpper), flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModel\(StringButcher.symbolCamelUpper), neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModel\(StringButcher.symbolCamelUpper).refresh()
        return \(StringButcher.symbolCamelLower)ToolNode
    }
}

"""
             */
            
            /*
            let format =
"""
get\(StringButcher.symbolCamelUpper)TextIconButtonToolNode
"""
            
            //MagicalTextIconButtonViewModel+\(StringButcher.symbolCamelUpper)
            
            
            
            */
            
        }
    }
}

#Preview {
    ContentView()
}
