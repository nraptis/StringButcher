//
//  SegmentNamer_Data.swift
//  StringButcher
//
//  Created by Nicky Taylor on 5/7/24.
//

import Foundation

let segmentNamers = [

    SegmentNamer(master: "display_mode", type: "secondary", modes: [
        "regular",
        "swivel",
        "split",
    ]),
    
    SegmentNamer(master: "document_mode", type: "primary", modes: [
        "view",
        "jiggles",
        "points",
        "weights",
    ]),
    
    SegmentNamer(master: "point_mode", type: "secondary", modes: [
        "create",
        "remove",
        "drag",
        "tangents",
    ]),
    
    SegmentNamer(master: "point_create_mode", type: "tertiary", modes: [
        "nearest",
        "after",
        "before",
    ]),
    
    SegmentNamer(master: "weight_mode", type: "primary", modes: [
        "affine",
        "points",
        "centers",
    ]),
    
    SegmentNamer(master: "weight_point_mode", type: "secondary", modes: [
        "create",
        "remove",
        "drag",
        "tangents",
    ]),

    SegmentNamer(master: "weight_point_create_mode", type: "tertiary", modes: [
        "nearest",
        "after",
        "before",
    ]),
    
    SegmentNamer(master: "animation_mode", type: "primary", modes: [
        "bounce",
        "wobble",
        "twist",
    ]),
]
