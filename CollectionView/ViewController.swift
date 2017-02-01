//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by devloper65 on 2/1/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

        let identifier = "CellIdentifier"
        let dataSource = DataSource()
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    extension ViewController : UICollectionViewDataSource {
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return dataSource.groups.count
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return dataSource.numbeOfRowsInEachGroup(section)
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier,for:indexPath) as! FruitCell
            
            let fruits: [Fruit] = dataSource.fruitsInGroup(indexPath.section)
            let fruit = fruits[indexPath.row]
            
            let name = fruit.name!
            
            cell.imageView.image = UIImage(named: name.lowercased())
            cell.caption.text = name.capitalized
            
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            
            let headerView: FruitsHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerViewIdentifier, for: indexPath) as! FruitsHeaderView
            
            headerView.sectionLabel.text = dataSource.gettGroupLabelAtIndex(indexPath.section)
            
            return headerView
        }
    }

}

