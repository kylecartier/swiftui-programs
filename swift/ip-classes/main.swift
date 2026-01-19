//
//  main.swift
//  ip-classes
//
//  Created by Kyle Cartier on 1/12/26.
//

import Foundation

// Prompt user to put in an IP address (Each individual octet)

print("Enter the first octet: ", terminator: "")
if let first_octet = readLine() {
    if let first_octet = Int(first_octet) {
        print("Enter the second octet: ", terminator: "")
        if let second_octet = readLine() {
            if let second_octet = Int(second_octet) {
                print("Enter the third octet: ", terminator: "")
                if let third_octet = readLine() {
                    if let third_octet = Int(third_octet) {
                        print("Enter the fourth octet: ", terminator: "")
                        if let fourth_octet = readLine() {
                            if let fourth_octet = Int(fourth_octet) {
                                if second_octet > 255 {
                                    exit(0)
                                }
                                if third_octet > 255 {
                                    exit(0)
                                }
                                if fourth_octet > 255 {
                                    exit(0)
                                }
                                switch first_octet {
                                    
                                case 10:
                                    print(first_octet,".",second_octet,".",third_octet,".",fourth_octet)
                                    print("This is a class A address.")
                                    print("This is also a private class A address.")
                                    
                                case 172:
                                    print(first_octet,".",second_octet,".",third_octet,".",fourth_octet)
                                    print("This is a class B address.")
                                    print("This is also a private class B address.")
                                    
                                case 192:
                                    print(first_octet,".",second_octet,".",third_octet,".",fourth_octet)
                                    print("This is a class C address.")
                                    print("This is also a private class C address.")
                                    
                                case 127:
                                    print(first_octet,".",second_octet,".",third_octet,".",fourth_octet)
                                    print("This is a class A address.")
                                    print("This is also a loopback address.")
                                  
                                case 169:
                                    print(first_octet,".",second_octet,".",third_octet,".",fourth_octet)
                                    print("This is a class B address.")
                                    print("This is also an APIPA address.")
                                   
                                case 1..<128:
                                    print(first_octet,".",second_octet,".",third_octet,".",fourth_octet)
                                    print("This is a class A address.")
                                   
                                case 128..<192:
                                    print(first_octet,".",second_octet,".",third_octet,".",fourth_octet)
                                    print("This is a class B address.")
                                   
                                case 192..<224:
                                    print(first_octet,".",second_octet,".",third_octet,".",fourth_octet)
                                    print("This is a class C address.")
        
                                default:
                                    exit(0)
                            
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

// End of Code
