//
//  CircularCollectionViewLayout.swift
//  fitnessChallenge
//
//  Created by Sarin Swift on 1/11/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class CircularCollectionViewLayout: UICollectionViewLayout {
    
    let itemSize = CGSize(width: 300, height: 426)
    
    var angleAtExtreme: CGFloat {
        return collectionView!.numberOfItems(inSection: 0) > 0 ?
        -CGFloat(collectionView!.numberOfItems(inSection: 0) - 1) * anglePerItem : 0
    }
    
    var angle: CGFloat {
        return angleAtExtreme * collectionView!.contentOffset.x / (collectionViewContentSize.width - collectionView!.bounds.width)
    }
    
    var attributesList = [CircularCollectionViewLayoutAttributes]()
    
    // when the radius changes you recalculate everything from the call to invalidateLayout()
    var radius: CGFloat = 500 {
        didSet {
            invalidateLayout()
        }
    }
    
    // makes sure the cells aren't spread out too far apart
    var anglePerItem: CGFloat {
        return atan(itemSize.width / radius)
    }
    
    override var collectionViewContentSize: CGSize {
        let collection = collectionView!
        let width = CGFloat(collection.numberOfItems(inSection: 0)) * itemSize.width
        let height = CGFloat(collection.bounds.height)
        return CGSize(width: width, height: height)
    }
    
    // This tells the collection view that you’ll be using CircularCollectionViewLayoutAttributes class and not the default one!
    override class var layoutAttributesClass: AnyClass {
        return CircularCollectionViewLayoutAttributes.self
    }
    
    // called each time the layout is invalidated
    override func prepare() {
        super.prepare()
        
        let anchorPointY = ((itemSize.height / 2.0) + radius) / itemSize.height
        let centerX = collectionView!.contentOffset.x + (collectionView!.bounds.width) / 2.0;
        attributesList = (0..<collectionView!.numberOfItems(inSection: 0)).map { (i)
            -> CircularCollectionViewLayoutAttributes in
            // Create an instance of CircularCollectionViewLayoutAttributes for each index path, and then set its size
            let attributes = CircularCollectionViewLayoutAttributes(forCellWith: NSIndexPath(item: i,
                                                                                             section: 0) as IndexPath)
            attributes.size = self.itemSize
            // position each item at the center of the screen
            attributes.center = CGPoint(x: centerX, y: self.collectionView!.bounds.midY)
            // rotate each item by the amount anglePerItem * i, in radians
            // and adds the value of angle to each item so it's not a constant but rather an angular position
            attributes.angle = self.angle + (self.anglePerItem * CGFloat(i))
            
            attributes.anchorPoint = CGPoint(x: 0.5, y: anchorPointY)
            return attributes
        }
        

    }
    
    // return the entire array of attributes
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributesList
    }
    
    // returns the attributes for the item
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return attributesList[indexPath.row]
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
}


class CircularCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {
    // anchor point becasue the roatation happens aroun the point that isnt the center!
    var anchorPoint = CGPoint(x: 0.5, y: 0.5)
    
    var angle: CGFloat = 0 {
        // want cells on the right to overlap the ones to their left, so you set zIndex
        // set transform to be equal to a rotation of angle radians
        didSet {
            zIndex = Int(angle * 1000000)
            transform = CGAffineTransform(rotationAngle: angle)
        }
    }
    
    // override this to guarantee that both the anchorPoint and angle properties are set when the object is copied.
    override func copy(with zone: NSZone? = nil) -> Any {
        let copiedAttributes: CircularCollectionViewLayoutAttributes = super.copy(with: zone) as! CircularCollectionViewLayoutAttributes
        copiedAttributes.anchorPoint = self.anchorPoint
        copiedAttributes.angle = self.angle
        return copiedAttributes
    }
}
