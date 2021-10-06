//
//  CustomLayout.swift
//  MySecondProject
//
//  Created by apple on 06/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
//step1: Creating protocolThis protocol has to be confirmed in your controller.

protocol CustomLayoutDelegate: AnyObject {
  func collectionView(
    _ collectionView: UICollectionView,
    heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat
}

class CustomLayout: UICollectionViewLayout {
    
    
    weak var delegate: CustomLayoutDelegate?

    private let numberOfColumns = 2
    private let cellPadding: CGFloat = 6

    private var cache: [UICollectionViewLayoutAttributes] = []

    private var contentHeight: CGFloat = 0

    private var contentWidth: CGFloat {
    guard let collectionView = collectionView else {
        return 0
    }
    let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }

    override var collectionViewContentSize: CGSize {
       return CGSize(width: contentWidth, height: contentHeight)
    }
 //This method sets the frame (attributes) for every cell and store in chache.

    override func prepare() {
      guard
        cache.isEmpty,
        let collectionView = collectionView
        else {
          return
      }
      
      let columnWidth = contentWidth / CGFloat(numberOfColumns)
      var xOffset: [CGFloat] = []
      for column in 0..<numberOfColumns {
        xOffset.append(CGFloat(column) * columnWidth)
      }
      var column = 0
      var yOffset: [CGFloat] = .init(repeating: 0, count: numberOfColumns)
    
      for item in 0..<collectionView.numberOfItems(inSection: 0) {
        let indexPath = IndexPath(item: item, section: 0)
          
        let photoHeight = delegate?.collectionView(
          collectionView,
          heightForPhotoAtIndexPath: indexPath) ?? 180
        let height = cellPadding * 2 + photoHeight
        let frame = CGRect(x: xOffset[column],
                           y: yOffset[column],
                           width: columnWidth,
                           height: height)
        let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
          
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        attributes.frame = insetFrame
        cache.append(attributes)
          
        contentHeight = max(contentHeight, frame.maxY)
        yOffset[column] = yOffset[column] + height
        
        column = column < (numberOfColumns - 1) ? (column + 1) : 0
      }
    }
    
    // This method returns the array of layout attributes
    override func layoutAttributesForElements(in rect: CGRect)
        -> [UICollectionViewLayoutAttributes]? {
      var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []
      
      // Loop through the cache and look for items in the rect
      for attributes in cache {
        if attributes.frame.intersects(rect) {
          visibleLayoutAttributes.append(attributes)
        }
      }
      return visibleLayoutAttributes
    }
    //to retrieve and return from cache
    override func layoutAttributesForItem(at indexPath: IndexPath)
        -> UICollectionViewLayoutAttributes? {
      return cache[indexPath.item]
    }
}
