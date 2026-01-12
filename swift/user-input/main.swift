//
//  main.swift
//  user-input
//
//  Created by Kyle Cartier on 1/12/26.
//

import Foundation

// Prompt user for input and put it on the same line as the output the user enters

print("Enter user input: ", terminator:"")

// Read line of what the user is entering for input

if let user_input = readLine()

{
 
    // Print the user's output that was entered into the prompt
    
    print("\(user_input)")
    
}

// End of Code

// To make a Windows .exe file, go to your project file's directory and put swiftc .\main.swift to do so.
// To run the Windows .exe file, enter .\main.exe to execute it.
