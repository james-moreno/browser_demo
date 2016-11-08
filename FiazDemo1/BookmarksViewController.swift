//
//  BookmarksViewController.swift
//  FiazDemo1
//
//  Created by James Moreno on 11/7/16.
//  Copyright © 2016 James Moreno. All rights reserved.
//

import UIKit

class BookmarksViewController: UIViewController {
    var bookmarks = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension BookmarksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bookmarks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarkCell", for: indexPath)
        cell.textLabel!.text = self.bookmarks[indexPath.row]
        return cell
    }
}


extension BookmarksViewController: UITableViewDelegate{
    
}
