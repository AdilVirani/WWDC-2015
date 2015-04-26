//
//  ContactViewController.swift
//  Adil Virani
//
//  Created by Adil  Virani on 4/24/15.
//  Copyright (c) 2015 Adil  Virani. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    var contacts = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        insertData()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Contact Me"
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: ContactTableViewCell

        let contactClass = ContactManager(dictionary: contacts[indexPath.row] as! NSDictionary)

        if(indexPath.row == 0) {
            cell = tableView.dequeueReusableCellWithIdentifier("cellTop") as! ContactTableViewCell
            
            cell.contactName.text = contactClass.nameContact
            cell.contactImage.image = UIImage(named:contactClass.imageIcon!)
            
            cell.contactImage.layer.cornerRadius = cell.contactImage.frame.size.width / 2;
            cell.contactImage.clipsToBounds = true;
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier("cellContacts") as! ContactTableViewCell
            
            cell.contactUrl.text = contactClass.nameContact
            cell.contactIcon.image = UIImage(named:contactClass.imageIcon!)
        }

        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.row == 0) {
            return 120
        } else {
            return 55
        }
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let contactClass = ContactManager(dictionary: contacts[indexPath.row] as! NSDictionary)

        if(indexPath.row == 1) {
            UIApplication.sharedApplication().openURL(NSURL(string: "mailto:" + contactClass.urlContact!)!)
        } else if(indexPath.row == 2) {
            UIApplication.sharedApplication().openURL(NSURL(string: "tel://" + contactClass.urlContact!)!)
        } else {
            UIApplication.sharedApplication().openURL(NSURL(string: contactClass.urlContact!)!)
        }
    }

    func insertData() {
        var one = ["Icon":"profile-image","Name":"Adil Sikander Virani", "Url":""]
        var fb = ["Icon":"fb-icon","Name":"/adisv9997", "Url":"http://fb.com/adisv9997"]
        var twitter = ["Icon":"twitter-icon","Name":"/adisv9997", "Url":"https://twitter.com/adisv9997"]
        var linkedin = ["Icon":"linkedin-icon","Name":"/adisv9997", "Url":"https://br.linkedin.com/in/adisv9997"]
        var instagram = ["Icon":"instagram-icon","Name":"/adil_virani", "Url":"http://instagram.com/adil_virani"]
        var mail = ["Icon":"mail-icon","Name":"me@adilvirani.io", "Url":"me@adilvirani.io"]
        var phone = ["Icon":"phone-icon","Name":"214-436-1433", "Url":"2144361433"]
        var github = ["Icon":"github-icon","Name":"/AdilVirani", "Url":"https://github.com/AdilVirani"]
        var bitbucket = ["Icon":"bitbucket-icon","Name":"/AdilVirani", "Url":"https://bitbucket.org/AdilVirani/"]

        contacts = [one, mail, phone, linkedin, github, bitbucket, instagram, fb, twitter]
    }
}