//
//  CategoryController.swift
//  mehus-shop
//
//  Created by Ashiq Uz Zoha on 2/9/23.
//

/*
 
 cat1 cat2 cat3 cat4 ---->
 
 prod1 prod2
 prod3 prod4
 |
 |
*/

import UIKit

class CategoryController: UIViewController {
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    
    let products: [DisplayProduct] = [
        DisplayProduct(id: 1, name: "Football", description: "Standard football mid range. The first was that your selector was missing the name of its parameter. ", discountedPrice: 40.0, originalPrice: 60.0, addedCount: 0),
        DisplayProduct(id: 1, name: "Cricket Bat", description: "Cricket bat high quality. Your code has two problems.", discountedPrice: 60.0, originalPrice: 80.0, addedCount: 0),
        DisplayProduct(id: 1, name: "Hockey stick", description: "Hockey stick mid range", discountedPrice: 50.0, originalPrice: 60.0, addedCount: 0),
        DisplayProduct(id: 1, name: "Rugby Ball", description: "Rugby ball description. One was identified and answered, but the other wasn't. The first was that your selector was missing the name of its parameter. ", discountedPrice: 90.0, originalPrice: 110.0, addedCount: 0),
        DisplayProduct(id: 1, name: "Adidas Shoe", description: "Adidas shoe description", discountedPrice: 80.0, originalPrice: 90.0, addedCount: 0),
        DisplayProduct(id: 1, name: "Puma Jersey", description: "Puma Jersey description", discountedPrice: 90.0, originalPrice: 100.0, addedCount: 0)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Browse Products"
        
        self.mCollectionView.dataSource = self
        self.mCollectionView.delegate = self
        
        self.mCollectionView.setCollectionViewLayout(UICollectionViewFlowLayout.init(), animated: true)
        
        let productNib = UINib(nibName: CellIdentifier.productCell, bundle: nil)
        
        self.mCollectionView.register(productNib, forCellWithReuseIdentifier: CellIdentifier.productCell)
    }
}

// UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout

extension CategoryController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        } else {
            return self.products.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = indexPath.section
        let row = indexPath.row
        
        if section == 0 {
            return UICollectionViewCell(frame: .zero)
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.productCell, for: indexPath) as! ProductCell
            let product = self.products[row]
            cell.setProductInformation(product: product)
            return cell
        }
        
    }
}

extension CategoryController: UICollectionViewDelegate {
    
}

extension CategoryController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return sizeForItem()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 10.0, bottom: 10.0, right: 10.0)
    }
    
}

extension CategoryController {
    
    func sizeForItem () -> CGSize {
        let screenWidth = self.view.frame.width
        let spacingBetweenItems = 10.0
        let spacingAtEdges = 10.0
        let numberOfItemsInEachRow = 2
        
        let totalSpacing = (spacingAtEdges * 2) + (Double((numberOfItemsInEachRow - 1)) * spacingBetweenItems)
        let itemWidth = (screenWidth - totalSpacing) / 2
        
        return CGSize(width: itemWidth, height: 275.0)
    }
}