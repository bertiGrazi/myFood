//
//  ViewController.swift
//  myFood
//
//  Created by Grazielli Berti on 31/01/22.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: - Variable
    var categoryList: [CategoryList]!
    let cellHeight: CGFloat = 130
    
    //MARK: - View
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = "Nome do Restaurante"
        
        return searchBar
    }()
    
    let labelAdress: UILabel = {
        let label = UILabel()
        label.text = "Praça Roberto Gomes Pedrosa, 1"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: UIScreen.main.bounds.width <= 375 ? 14 : 16)
        label.textAlignment = .left
        return label
    }()
    
    let editionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Editar", for: .normal)
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: UIScreen.main.bounds.width <= 375 ? 14 : 18, weight: .bold)
        button.setTitleColor(.link, for: .normal)
        button.layer.borderColor = CGColor(red: 0.0, green: 0.0, blue: 0.255, alpha: 100)
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 8
        return button
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
            collectionView.register(CategoryFoodCollectionViewCell.self,
                                    forCellWithReuseIdentifier: CategoryFoodCollectionViewCell.identifier)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupNavigation()
        setupView()
        setupContrains()
        bindUI()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let list = CategoryList(imageCategory: UIImageView(image: UIImage(named: "category_pasta")), categoryProduct: "Massa")
        let list2 = CategoryList(imageCategory: UIImageView(image: UIImage(named: "category_pasta")), categoryProduct: "Massa")
        let list3 = CategoryList(imageCategory: UIImageView(image: UIImage(named: "category_pasta")), categoryProduct: "Massa")
        let list4 = CategoryList(imageCategory: UIImageView(image: UIImage(named: "category_pasta")), categoryProduct: "Massa")
        let list5 = CategoryList(imageCategory: UIImageView(image: UIImage(named: "category_pasta")), categoryProduct: "Massa")
        let list6 = CategoryList(imageCategory: UIImageView(image: UIImage(named: "category_pasta")), categoryProduct: "Massa")
        let list7 = CategoryList(imageCategory: UIImageView(image: UIImage(named: "category_pasta")), categoryProduct: "Massa")
//        let list8 = CategoryList(categoryProduct: "Massa")
//        let list9 = CategoryList(categoryProduct: "Massa")
//        let list10 = CategoryList(categoryProduct: "Massa")
//        let list11 = CategoryList(categoryProduct: "Massa")
//        let list12 = CategoryList(categoryProduct: "Massa")

        //categoryList = [list, list2, list3, list4, list5, list6, list7, list8, list9, list10, list11, list2]
        categoryList = [list, list2, list3, list4, list5, list6, list7]
    }
    
    fileprivate func setupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(labelAdress)
        scrollView.addSubview(editionButton)
        scrollView.addSubview(collectionView)
    }
    
    fileprivate func setupContrains() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        
        labelAdress.frame = CGRect(x: UIScreen.main.bounds.width <= 375 ? scrollView.left+10 : scrollView.left+20,
                                   y: UIScreen.main.bounds.width <= 375 ? scrollView.top+5 : scrollView.top+20,
                                   width: view.width+20,
                                   height: 50
        )
        
        editionButton.frame = CGRect(x: UIScreen.main.bounds.width <= 375 ? labelAdress.right-110 : labelAdress.right-180,
                                     y: UIScreen.main.bounds.width <= 375 ? scrollView.top+10 : scrollView.top+20,
                                     width: UIScreen.main.bounds.width <= 375 ? 70 : 100,
                                     height: UIScreen.main.bounds.width <= 375 ? 40 : 50
        )
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: labelAdress.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 3),
            collectionView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            collectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    fileprivate func bindUI() {
        editionButton.addTarget(self,
                                action: #selector(didTapButtonEdition),
                                for: .touchUpInside
        )
    }
    
    fileprivate func setupNavigation() {
        self.navigationItem.title = "MyFood App"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        UINavigationBar.appearance().isTranslucent = false
        
        let app = UINavigationBarAppearance()
        
        let navigationBar = self.navigationController?.navigationBar
        
        app.backgroundColor = .clear
        app.configureWithOpaqueBackground()
        app.titleTextAttributes = [.foregroundColor: UIColor.systemPink]
        app.largeTitleTextAttributes = [.foregroundColor: UIColor.systemPink]
        app.backgroundColor = .systemGroupedBackground
        
        self.navigationController?.navigationBar.scrollEdgeAppearance = app
        
        navigationBar!.standardAppearance = app
        navigationBar!.scrollEdgeAppearance = app
        
        let search = UISearchController(searchResultsController: nil)
        //        search.searchBar.delegate = self
        search.searchResultsUpdater = self as? UISearchResultsUpdating
        search.searchBar.placeholder = "Nome do Restaurante"
        search.searchBar.searchTextField.tintColor = UIColor.gray
        search.searchBar.setImage(UIImage(named: "magnifyingglass")?.withTintColor(UIColor.systemGray), for: .search, state: .normal)
        
        self.navigationItem.searchController = search
    }
    
    @objc func didTapButtonEdition() {
        let editAdress = EditAdressViewController()
        self.navigationController?.pushViewController(editAdress, animated: true)
    }
}
//MARK: - UICollectionView: UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {

}

//MARK: - UICollectionView: UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryFoodCollectionViewCell.identifier, for: indexPath) as! CategoryFoodCollectionViewCell
        let category = categoryList[indexPath.row]
        cell.configure(for: category)

        return cell
    }
}
