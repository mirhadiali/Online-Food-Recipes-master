//
//  RecipesViewController.swift
//  New Design
//
//  Created by Kingdom Vision on 12/9/1397 AP.
//  Copyright © 1397 Kingdom Vision. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var collectionViewheight: NSLayoutConstraint!
    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet var bottomViews: [UIView]!
    
    
    @IBOutlet weak var recipesTableView: UITableView!
    
    @IBOutlet weak var recipesCollectionView: UICollectionView!
    
    var featuredCollectionViewImages = ["Tufu noodle","Tufu noodle","Tufu noodle","Tufu noodle","Tufu noodle","Tufu noodle"]
     var featuredCollectionViewFoodType = ["Healthy Food","Healthy Food","Healthy Food","Healthy Food","Healthy Food","Healthy Food"]
    var featuredTableViewImages = ["Salad","Salad","Salad","Salad","Salad","Salad","Salad","Salad","Salad"]
   
    
    var popularCollectionViewImages = ["Burger","Burger","Burger","Burger","Burger","Burger","Burger","Burger"]
    var popularCollectionViewFoodType = ["Fast Food","Fast Food","Fast Food","Fast Food","Fast Food","Fast Food","Fast Food","Fast Food",]
    var popularTableViewImages = ["Presto","Presto","Presto","Presto","Presto","Presto","Presto"]
    
    var discription = ["Chicken Salad", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...", "There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain", "Lorem ipsum dolor sit amet. ","Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...", "There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain", "Lorem ipsum dolor sit amet. "]
    
    var collectionViewItems = [String]()
    var collectionViewFoodType = [String]()
    var tableViewItems = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipesCollectionView.delegate = self
        recipesCollectionView.dataSource = self
        
        recipesTableView.rowHeight = UITableView.automaticDimension
        recipesTableView.estimatedRowHeight = 100

        recipesTableView.delegate = self
        recipesTableView.dataSource = self
    
      //  self.imageViewHeight.constant = self.view.frame.height/3
       // self.collectionViewheight.constant = self.view.frame.height/4
        contentViewHeightConstraint.constant += coverImage.frame.height - 20
        
        bottomViews[1].isHidden = true
        bottomViews[2].isHidden = true
        
        
        collectionViewItems = featuredCollectionViewImages
        collectionViewFoodType = featuredCollectionViewFoodType
        tableViewItems = featuredTableViewImages
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func featuredBtn(_ sender: UIButton) {
        for view in bottomViews{
            if view.tag == sender.tag{
                //view.isHidden = false
                view.isHidden = false
            }
            else{
               // view.isHidden = true
                view.isHidden = true
            }
            if sender.tag == 0{
                collectionViewItems = featuredCollectionViewImages
                collectionViewFoodType = featuredCollectionViewFoodType
                tableViewItems = featuredTableViewImages
                recipesTableView.reloadData()
                recipesCollectionView.reloadData()
            }
            else if sender.tag == 1{
                collectionViewItems = popularCollectionViewImages
                collectionViewFoodType = popularCollectionViewFoodType
                tableViewItems = popularTableViewImages
                recipesTableView.reloadData()
                recipesCollectionView.reloadData()
            }
        }
    }
    
    @IBAction func viewMore(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PopUpViewController") as? PopUpViewController
        self.present(vc!, animated: true, completion: nil)

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipesCollectionViewCell", for: indexPath) as! RecipesCollectionViewCell
        cell.foodName.text = collectionViewItems[indexPath.row]
        cell.imageView.image = UIImage(named: collectionViewItems[indexPath.row])
        cell.foodType.text = collectionViewFoodType[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = recipesCollectionView.frame.width
        let height = recipesCollectionView.frame.height
        let cell = CGSize.init(width: width/2.5 + 30 , height: height - 15)
        return cell
    }
}

extension RecipesViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return discription.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipesTableViewCell", for: indexPath) as! RecipesTableViewCell
        cell.itemImageView.image = UIImage(named: tableViewItems[indexPath.row])
        cell.itemName.text = tableViewItems[indexPath.row]
        cell.discription.text = discription[indexPath.row]
        
        cell.setNeedsUpdateConstraints()
        cell.updateConstraintsIfNeeded()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
//    override func updateViewConstraints() {
//    //    tableHeightConstraint.constant = recipesTableView.contentSize.height
//        recipesTableView.rowHeight = recipesTableView.contentSize.height
//        super.updateViewConstraints()
//    }
    
}
