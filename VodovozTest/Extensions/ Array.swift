//
//   Array.swift
//  VodovozTest
//
//  Created by Азат on 09.08.2024.
//

import Foundation

extension Array {
  subscript(safe index: Int) -> Element? {
    indices.contains(index) ? self[index] : nil
  }
}
