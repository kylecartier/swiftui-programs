//
//  ContentView.swift
//  calculator
//
//  Created by Kyle Cartier on 3/20/25
//  Updated on 1/10/26
//

import SwiftUI

struct ContentView: View {
    
    @State var value = "0"
    @State var runningNumber = 0.0
    @State var currentOperation: Operation = .none
    @State var awaitingNewNumberInput = true
    
    // Perform Operations
    
    enum Operation {
        case add, subtract, multiply, divide, none
    }
    
    // What the buttons will say
    
    enum CalcButton: String {
        case one = "1"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case zero = "0"
        case add = "+"
        case subtract = "-"
        case multiply = "x"
        case divide = "/"
        case equal = "="
        case negative = "+/-"
        case clear = "Clear"
        
        // Make the color for each set of buttons
        
        var buttonColor: Color {
            switch self {
            case .add, .subtract, .multiply, .divide, .equal:
                return Color(UIColor(red: 45/250, green: 45/250, blue: 25/250, alpha:1))
                
            case .clear, .negative:
                return Color(UIColor(red: 40/250, green: 60/250, blue: 60/250, alpha:1))
                
            default:
                return Color(UIColor(red: 70/250, green: 55/250, blue: 55/250, alpha:1))
            }
        }
    }
    
    // What the buttons will be
    
    let buttons: [[CalcButton]] = [
        [.clear, .negative, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .equal],
    ]
    
    // Form the Calculator!
    
    var body: some View {
        ZStack {
            Color(UIColor(red: 30/250, green: 30/250, blue: 30/250, alpha:1)).ignoresSafeArea(edges: .all)
            VStack {
                Spacer()
                
                // Dsiplay Text
                
                HStack {
                    Spacer()
                    Text(value)
                        .bold(true)
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                }
                
                // Display Buttons
                
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 40) {
                        ForEach(row, id: \.self) { char in
                            Button(action: {
                                self.didTap(button: char)
                            }, label: {
                                Text(char.rawValue)
                                    .frame(
                                        width: self.buttonWidth(char: char, containerWidth: 325),
                                        height: self.buttonHeight(containerWidth: 300)
                                    )
                                    .font(.system(size: 32))
                                    .background(char.buttonColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(self.buttonWidth(char: char, containerWidth: 1000))
                                    .padding(.bottom, 25)
                            })
                        }
                    }
                }
            }
        }
    }
    
    // How the buttons work!
    
    func didTap(button: CalcButton) {
        switch button {
            
        case .add, .subtract, .multiply, .divide, .equal:
            if button == .add {
                self.currentOperation = .add
                self.runningNumber = Double(self.value)  ?? 0.0
            }
            else if button == .subtract {
                self.currentOperation = .subtract
                self.runningNumber = Double(self.value) ?? 0.0
            }
            else if button == .multiply {
                self.currentOperation = .multiply
                self.runningNumber = Double(self.value) ?? 0.0
            }
            else if button == .divide {
                self.currentOperation = .divide
                self.runningNumber = Double(self.value) ?? 0.0
            }
            else if button == .equal {
                let runningValue = self.runningNumber
                let currentValue = Int(self.value)
                switch self.currentOperation {
                    
                case .add: let add_result = Double(runningValue) + (Double)(currentValue ?? Int(0))
                    value = String(format: "%.0f", add_result)
                    currentOperation = .none
                    awaitingNewNumberInput = true
                    
                case .subtract: let subtract_result = Double(runningValue) - (Double)(currentValue ?? Int(0))
                    value = String(format: "%.0f", subtract_result)
                    currentOperation = .none
                    awaitingNewNumberInput = true
                    
                case .multiply: let multiply_result = Double(runningValue) * (Double)(currentValue ?? Int(0))
                    value = String(format: "%.0f", multiply_result)
                    currentOperation = .none
                    awaitingNewNumberInput = true
                    
                case .divide:
                    guard let current = currentValue, current != 0
                            
                    else {
                        self.value = "0"
                        currentOperation = .none
                        awaitingNewNumberInput = true
                        break
                    }
                    
                    let division_result = Double(runningValue) / Double(current)
                    
                    if division_result == floor(division_result) {
                        self.value = String(Int(division_result))
                    }
                    
                    else {
                        self.value = String(format: "%.2f", division_result)
                    }
                    currentOperation = .none
                    awaitingNewNumberInput = true
                case .none:
                    break
                }
            }
            
            if button != .equal {
                self.value = "\(0)"
            }
            
        case .clear: self.value = "0"
        case .negative: self.value = "-"
            
        default:
            let number = button.rawValue
            if self.value == "0" {
                value = number
            }
            else {
                self.value = "\(self.value)\(number)"
            }
        }
    }
    
    // Button Width and Height
    
    func buttonWidth(char: CalcButton, containerWidth: CGFloat) -> CGFloat {
        if char == .zero {
            return ((containerWidth - (6*5)) / 3) * 2.76
        } else if char == .clear {
            return ((containerWidth - (6*14)) / 4) * 2.8
        }
        return (containerWidth - (6*12)) / 4
    }
    
    func buttonHeight(containerWidth: CGFloat) -> CGFloat {
        return ((containerWidth - (6*12)) / 4)
    }
}
// Preview on Screen

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// End of Code
