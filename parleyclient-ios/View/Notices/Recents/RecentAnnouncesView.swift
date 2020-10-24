//
//  AnnouncesView.swift
//  parleyclient-ios
//
//  Created by Victor Castro on 10/10/20.
//

import UIKit

class AnnouncesView: UIViewController {

    @IBOutlet weak var tblAnnounces: UITableView!
    
    private var announces: [String] = []
    
    override func viewWillAppear(_ animated: Bool) {
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        announces.append("First")
        announces.append("Second")
        announces.append("Second")
        announces.append("Second")
        announces.append("Second")
        announces.append("Second")
        announces.append("Second")
        announces.append("Second")
        

        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Ver todos", style: .plain, target: self, action: #selector(addTapped))
        
    }
    
    fileprivate func setup() {
        tblAnnounces.delegate = self
        tblAnnounces.dataSource = self
        tblAnnounces.register(UINib(nibName: "AnnounceTableViewCell", bundle: nil), forCellReuseIdentifier: "AnnounceTableViewCell")
        tblAnnounces.register(AnnounceTableViewHeaderFooter.self, forHeaderFooterViewReuseIdentifier: "AnnounceTableViewHeaderFooter")
        tblAnnounces.backgroundColor = .systemBackground
    }

    @objc func addTapped() {
        print("addTapped")
    }
}

extension AnnouncesView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return announces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnnounceTableViewCell") as! AnnounceTableViewCell
        cell.backgroundColor = .systemBackground
        cell.selectionStyle = .none

        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "AnnounceTableViewHeaderFooter") as! AnnounceTableViewHeaderFooter
        let date = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "es_PE")
        formatter.dateFormat = "EEEE d, MMMM"

        view.today.text = formatter.string(from: date).uppercased()
        view.title.text = "Anuncios"
        view.image.image = UIImage(named: "isotipo")

        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 282
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt=")
    }
}
