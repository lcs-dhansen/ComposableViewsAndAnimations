//
//  ExerciseOneView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI
import UIKit

struct ExerciseOneView: View {
    
    // MARK: Stored properties
    
    // Controls whether this view is showing or not
    @Binding var showThisView: Bool
    
    // Controls what typeface the text is shown in
    @State private var typeFace: String = "Helvetica-Neue"
    
    // Whether to apply the animation
    @State private var useAnimation = false
    
    // Controls the size of the circle
    @State private var scaleFactor: CGFloat = 1.0
    
    // Controls the hue of the circle
    @State private var hue: Color = .red
    
    // Controls the position of the circle
    @State private var offset: CGFloat = -200.0

    
    
    // MARK: Computed properties
    
    // List all fonts available
    // NOTE: This is a very useful gist...
    //       https://gist.github.com/kristopherjohnson/c825cb97b1ad1fe0bc13d709986d0763
    private static let fontNames: [String] = {
        var names: [String] = []
        for familyName in UIFont.familyNames {
            names.append(contentsOf: UIFont.fontNames(forFamilyName: familyName))
        }
        return names.sorted()
    }()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Text(typeFace)
                    .font(.custom(typeFace, size: 30.0))
                    .foregroundColor(hue)
                    .scaleEffect(scaleFactor)
                    .onTapGesture {
                        if scaleFactor > 0.5 {
                            // Reduce the size of the circle by a tenth
                            scaleFactor -= 0.2
                        } else {
                            // Make sure the button doesn't entirely disappear
                            scaleFactor = 2
                            // Change the color of the view to a random hue
                            hue = Color(hue: Double.random(in: 1...360) / 360.0,
                                        saturation: 0.8,
                                        brightness: 0.8)
                        }
                    }
                    .offset(x: 0, y: offset)
                   
                    
                    .navigationTitle("Exercise 1")
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            Button("Done") {
                                hideView()
                            }
                        }
                    }
                
            }
            
        }
    }
        // MARK: Functions
        
        // Makes this view go away
        func hideView() {
            showThisView = false
        }
        
    }

    struct ExerciseOneView_Previews: PreviewProvider {
        static var previews: some View {
            ExerciseOneView(showThisView: .constant(true))
        }
    }

