//
//  ViewController.swift
//  ProductListing
//
//  Created by Poonam on 24/11/21.
//

import UIKit
// View to display the list of products fetched from API
class ViewController: UIViewController {
    
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var listVC: UITableView!
    
     var presenter: ProductListPresenterInterface?
    var datasource : [ProductModel] = []
    
    // MARK: - ViewDidLoad
    //Connect to presenter to fetch the Product List
    override func viewDidLoad() {
        super.viewDidLoad()
        listVC.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "Cell")
        listVC.delegate = self
        listVC.accessibilityLabel = "ListView"
        listVC.accessibilityIdentifier = "ListView"
        
        self.showLoading();
        presenter?.startFetchingProductList()
    }
    
    var indicator = UIActivityIndicatorView()
    
    func activityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        indicator.style = UIActivityIndicatorView.Style.large;
        indicator.center = self.view.center
        DispatchQueue.main.async {
            self.view.addSubview(self.indicator)
        }
    }
}

//MARK: Extension to adopt View Protocol,
// once the fetch product list is successful, it reloads the list view
// to populate the data
extension ViewController : ProductListViewInterface {
    func showAlert(title: String, msg : String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func updateView(_ list : [ProductModel]) {
        datasource = list
        DispatchQueue.main.async {
            self.hideLoading();
            self.listVC.reloadData()
        }
    }
    
     //MARK: Loading Icon
    func showLoading() {
        activityIndicator()
        self.view.isUserInteractionEnabled = false;
        indicator.startAnimating()
        indicator.backgroundColor = .white
    }
    
    func hideLoading() {
        indicator.stopAnimating()
        indicator.hidesWhenStopped = true
        self.view.isUserInteractionEnabled = true;
        
    }
}

//MARK: TableView Datasource to populate and configure the cell
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footerView;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell : CustomCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? CustomCell else {
            return UITableViewCell()
        }
        cell.configureCell( datasource[indexPath.row])
        cell.accessibilityLabel = "myCell_\(indexPath.row)"
        cell.accessibilityIdentifier = "myCell_\(indexPath.row)"


        return cell;
    }
}

//MARK: Action Handling on click of row through UITableViewDelegate
extension ViewController : UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
        let radius = cell.contentView.layer.cornerRadius
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: radius).cgPath
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presenter?.navigateToDetailScreen(details: datasource[indexPath.row]);
    }
}
