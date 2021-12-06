//
//  ViewController.swift
//  Test App iOS
//
//  Created by Julia Liliana Sierra Rojas on 29/11/21.
//

import UIKit

// MARK: - Class for implement view sites
class ViewController: BaseViewController {
    
    
    @IBOutlet weak var tvSites: UITableView!
    
    var coordinator: CoordinatorImp?
    var sitesViewModel: SitesListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    
    // MARK: - Function for setup the view
    private func setup() {
        self.tvSites?.delegate = self
        self.tvSites?.dataSource = self
        self.loadingView(true)
        Utility.registerCells(tableView: tvSites ?? UITableView(), isSite: true)
        sitesViewModel?.loadSites { error in
            if error != nil {
                self.loadingView(false)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.showSimpleAlert()
                }
            } else {
                self.tvSites.reloadData()
                self.loadingView(false)
            }
        }
    }


}

// MARK: - Implement UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let site = sitesViewModel?.item(at: indexPath)
        coordinator?.searchScreen(from: site ?? Site())
    }
}

// MARK: - Implement UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sitesViewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Utility.getSiteCell(to: indexPath, tableView: tableView)
        cell.configure(sitesViewModel?.item(at: indexPath) ?? Site())
        return cell
    }
    
    
}
