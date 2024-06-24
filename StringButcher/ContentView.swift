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
swivel_camera_zoom
swivel_camera_pan
swivel_camera_tilt
swivel_camera_twist
swivel_light_ambient
swivel_light_diffuse
swivel_light_specular
bounce_speed
bounce_power
twist_speed
twist_power
jiggle_speed
jiggle_power
zoom_amount
loop_speed
movement_horizontal
movement_vertical
inflate_amount_start
inflate_amount_end
inflate_amount
circle_factor
"""
            
            let format = """
            import Foundation

            extension ToolInterfaceViewModel {
                func get\(StringButcher.symbolCamelUpper)SliderToolNode(widthCategory: ToolInterfaceElementSliderWidthCategory,
                                                  neighborTypeLeft: ToolInterfaceElementType?,
                                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
                    let orientation = jiggleViewModel.jiggleDocument.orientation
                    let textLine1 = ToolInterfaceStringLibrarySliders.sliderText\(StringButcher.symbolCamelUpper)Line1()
                    let textLine2 = ToolInterfaceStringLibrarySliders.sliderText\(StringButcher.symbolCamelUpper)Line2()
                    let iconPack = SliderIconLibrary.boxus
                    var friendLabel1Line1: String?; var friendLabel1Line2: String?
                    var friendLabel2Line1: String?; var friendLabel2Line2: String?
                    var friendLabel3Line1: String?; var friendLabel3Line2: String?
                    var friendLabel4Line1: String?; var friendLabel4Line2: String?
                    /*
                    if widthCategory == .fullWidth {
                        friendLabel1Line1 = ToolInterfaceStringLibrarySliders.sliderTextBounceSpeedLine1()
                        friendLabel1Line2 = ToolInterfaceStringLibrarySliders.sliderTextBounceSpeedLine2()
                    }
                    */
                    let configuration = ToolInterfaceElementSliderConfiguration(iconPack: iconPack,
                                                                                orientation: orientation,
                                                                                nameLabelLine1: textLine1,
                                                                                nameLabelLine2: textLine2,
                                                                                friend_1_nameLabelLine1: friendLabel1Line1,
                                                                                friend_1_nameLabelLine2: friendLabel1Line2,
                                                                                friend_2_nameLabelLine1: friendLabel2Line1,
                                                                                friend_2_nameLabelLine2: friendLabel2Line2,
                                                                                friend_3_nameLabelLine1: friendLabel3Line1,
                                                                                friend_3_nameLabelLine2: friendLabel3Line2,
                                                                                friend_4_nameLabelLine1: friendLabel4Line1,
                                                                                friend_4_nameLabelLine2: friendLabel4Line2,
                                                                                minimumValue: Jiggle.bouncePowerMin,
                                                                                maximumValue: Jiggle.bouncePowerMax,
                                                                                valueWholeNumberCount: 2,
                                                                                valueDecimalCount: 3,
                                                                                widthCategory: widthCategory)
                    
                    let flex = Self.getSliderFlex(orientation: orientation,
                                                  configuration: configuration,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
                    let viewModel\(StringButcher.symbolCamelUpper) = MagicalSliderViewModel\(StringButcher.symbolCamelUpper)(jiggleViewModel: jiggleViewModel,
                                                                                 toolInterfaceViewModel: self,
                                                                                 sliderConfiguration: configuration)
                    let result = ToolNode(id: getToolNodeID(),
                                          element: .slider\(StringButcher.symbolCamelUpper),
                                          flex: flex,
                                          toolInterfaceViewModel: self,
                                          magicalViewModel: viewModel\(StringButcher.symbolCamelUpper),
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
                    viewModel\(StringButcher.symbolCamelUpper).refresh()
                    return result
                }
            }

            
            
            
            """
            
            
            /*
            let format = """
            import Foundation

            @Observable class MagicalSliderViewModel\(StringButcher.symbolCamelUpper): MagicalSliderViewModel {
                
                override func refresh() {
                    /*
                    if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                        refreshEnabled(value: selectedJiggle.bouncePower)
                    } else {
                        refreshDisabled()
                    }
                    */
                }
                
                deinit {
                    print("MagicalSlider \(StringButcher.symbolCamelUpper) - Dealloc")
                }
                
                override func handleSlideStarted(percent: CGFloat) {
                    super.handleSlideStarted(percent: percent)
                    let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
                    jiggleViewModel.notifySliderStarted\(StringButcher.symbolCamelUpper)(value: value)
                }
                
                override func handleSlideUpdated(percent: CGFloat) {
                    let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
                    /*
                    if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                        
                        selectedJiggle.bouncePower = value
                    }
                    */
                    super.handleSlideUpdated(percent: percent)
                }
                
                override func handleSlideFinished(percent: CGFloat) {
                    super.handleSlideFinished(percent: percent)
                    let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
                    /*
                    
                    if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                        selectedJiggle.bouncePower = value
                    }
                    
                    */
                    jiggleViewModel.notifySliderFinished\(StringButcher.symbolCamelUpper)(value: value)
                }
            }

            """
            */
            
            /*
            let format = """
            
            func notifySliderStarted\(StringButcher.symbolCamelUpper)(value: Float) {
            print("notifySliderStarted\(StringButcher.symbolCamelUpper): \\(value)")
            }
            
            func notifySliderFinished\(StringButcher.symbolCamelUpper)(value: Float) {
            print("notifySliderFinished\(StringButcher.symbolCamelUpper): \\(value)")
            }
            """
            */
            
            //let format = "MagicalSliderViewModel+\(StringButcher.symbolCamelUpper)"
            
            //let format = "ToolInterfaceViewModel+\(StringButcher.symbolCamelUpper)"
            
            //let format = "case .slider\(StringButcher.symbolCamelUpper):\nreturn .slider"
            
            /*
            let format = """
static func sliderText\(StringButcher.symbolCamelUpper)Line1() -> String? {
    GeneralStringLibrary.stringOrNull(String(localized: "\(StringButcher.symbolOriginal)_line_1", table: "ToolInterfaceSliders"))
}
    
static func sliderText\(StringButcher.symbolCamelUpper)Line2() -> String? {
    GeneralStringLibrary.stringOrNull(String(localized: "\(StringButcher.symbolOriginal)_line_2", table: "ToolInterfaceSliders"))
}

"""
             */
            
            /*
            let format =
"""
static let _\(StringButcher.symbolCamelLower) = UIColor(named: "\(StringButcher.symbolOriginal)") ?? UIColor()
"""
            */
            
            
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
