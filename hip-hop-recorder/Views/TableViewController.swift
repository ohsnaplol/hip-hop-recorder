//
//  TableViewController.swift
//  hip-hop-recorder
//
//  Created by Marcello Galvan on 8/14/18.
//  Copyright © 2018 Marcello Galvan. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var songs: [URL] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let documentsURL = getDocumentsDirectory()
        let fm = FileManager.default
        
        do {
            songs = try fm.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil, options: [])
        } catch {
            // failed to read directory – bad permissions, perhaps?
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = songs[indexPath.row].lastPathComponent
        return cell
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        print(paths)
        return paths[0]
    }

}
