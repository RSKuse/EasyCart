//
//  EmptyCartViewController.swift
//  EasyCart
//
//  Created by Reuben Simphiwe Kuse on 2024/04/06.
//

import UIKit

class EmptyCartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cart = ShoppingCartModel(products: [], storeName: "H&M")
   
    let shopProducts: [Product] = [Product(itemName: "Make-up brushes", itemPrice: 253.89, itemImage: UIImage(named: "makeup_sponges_closed")!),
                                   Product(itemName: "Nappies", itemPrice: 463.20, itemImage: UIImage(named: "body_suit")!),
                                   Product(itemName: "Mini makeup sponges - multi", itemPrice: 53.00, itemImage: UIImage(named: "makeup_sponges_closed")!),
                                   Product(itemName: "Vaseline", itemPrice: 25.00, itemImage: UIImage(named: "makeup_sponges_closed")!),
                                   Product(itemName: "Shield Roll-On", itemPrice: 32.50, itemImage: UIImage(named: "makeup_sponges_closed")!)]
    

    lazy var shoppingCartTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.isHidden = true
        tableView.dataSource = self
        tableView.allowsSelection = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var addItemButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(named: "icAdd")
        button.setImage(icon, for: .normal)
        button.clipsToBounds = true
        button.imageView?.contentMode = .scaleToFill
        button.addTarget(self, action: #selector(addProductToCart), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var totalAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Amount:"
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "R0.00"
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    lazy var emptyCartLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.text = "Your cart will be shown here. \nGet started by adding items"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    lazy var payCheckoutButton: UIButton = {
        let button = UIButton()
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Pay & Checkout", for: .normal)
        button.layer.cornerRadius = 8.0
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 245.0/255.0, green: 246.0/255.0, blue: 250.0/255.0, alpha: 1.0)
        button.addTarget(self, action: #selector(checkoutButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Shopping Cart"
        view.backgroundColor = UIColor.white
        setupUI()
        setupNavigationBar()
        registerCell()
      
    }
    
    func setupNavigationBar() {
        
        let addBarButton = UIBarButtonItem(customView: addItemButton)
        
        addItemButton.widthAnchor.constraint(equalToConstant: 28).isActive = true
        addItemButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        navigationItem.rightBarButtonItems = [addBarButton]

    }
    
    func setupUI() {
        view.addSubview(shoppingCartTableView)
        view.addSubview(emptyCartLabel)
        view.addSubview(totalAmountLabel)
        view.addSubview(priceLabel)
        view.addSubview(payCheckoutButton)
        
        emptyCartLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        emptyCartLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        emptyCartLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 114).isActive = true
//        emptyCartLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -114).isActive = true
        
        
        totalAmountLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -4).isActive = true
        totalAmountLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        priceLabel.bottomAnchor.constraint(equalTo: payCheckoutButton.topAnchor, constant: -16).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        payCheckoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32).isActive = true
        payCheckoutButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        payCheckoutButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        payCheckoutButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        shoppingCartTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        shoppingCartTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        shoppingCartTableView.bottomAnchor.constraint(equalTo: totalAmountLabel.topAnchor, constant: -20).isActive = true
        shoppingCartTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
    }
    
    func registerCell() {
        shoppingCartTableView.register(ShoppingCartCells.self, forCellReuseIdentifier: "ShoppingCartCellsID")

    }
    @objc func checkoutButtonTapped() {
        print("Checkout Selected")

    }
    
    @objc func addProductToCart () {
        // showCartWithProducts()
        addProductsToCart()
        activateCheckoutButton()
        showCartWithProducts()
        displayCost()
        
    }
    
    func activateCheckoutButton() {
        if cart.products.isEmpty == false {
            payCheckoutButton.isEnabled = true
            payCheckoutButton.setTitleColor(UIColor.white, for: .normal)
            payCheckoutButton.backgroundColor = UIColor.blue
        }
        
    }

    func addProductsToCart() {
        // print(cart.products.count)
        let productSelected = shopProducts[Int.random(in: 0...shopProducts.count - 1)]
        cart.products.append(productSelected)
        // print(cart.products.count)
    }
    
    func showCartWithProducts() {
        print("Number of products: \(cart.products.count)")
        if cart.products.count > 0 {
            emptyCartLabel.isHidden = true
            shoppingCartTableView.isHidden = false
            shoppingCartTableView.reloadData() // This reloads the tableView and displays any new data found
        }
        
    }
    func displayCost() {
        
        var totalAmount: Double = 0

        for product in cart.products {
            totalAmount += product.itemPrice
        }
        
        print(totalAmount)
        
        priceLabel.text = "R\(totalAmount)"
 
    }

}





