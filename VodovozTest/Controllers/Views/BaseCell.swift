//
//  BaseCell.swift
//  VodovozTest
//
//  Created by Азат on 08.08.2024.
//

import UIKit

class BaseCell: UICollectionViewCell {
  static var reuseIdentifier: String {
      String(describing: Self.self)
  }
}
