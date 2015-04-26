//
//  WhoViewController.swift
//  Adil Virani
//
//  Created by Adil  Virani on 4/24/15.
//  Copyright (c) 2015 Adil  Virani. All rights reserved.
//

import UIKit

class WhoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    var history = []

    override func viewDidLoad() {
        super.viewDidLoad()
       
        insertData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true;
    }

    func updateTableView() {
        self.tableView.reloadData()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return history.count
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        if(section == 0) {
            var header = HeaderDescription.instanceFromNib()
            
            return header
        } else {
            let lifeClass = LifeManager(dictionary: history[section] as! NSDictionary)
            
            let color = getColorBySection(section)

            var header = HeaderTableViewCell.instanceFromNib()

            header.titleCell.text = lifeClass.title
            header.yearCell.text = lifeClass.year
            header.imageCell.image = UIImage(named:lifeClass.imageIcon!)
            header.headerCell.backgroundColor = color

            return header
        }
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section == 0) {
            return 150
        } else {
            return 100
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("lifeCell") as! LifeTableViewCell
        
        var lifeClass = LifeManager(dictionary: history[indexPath.section] as! NSDictionary)

        if(indexPath.section == 0) {
            buttonScrollDown(cell)
            cell.descriptionLife.textColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        } else {
            cell.arrowDown.hidden = true
            cell.descriptionLife.textColor = UIColor.whiteColor()
        }
        
        var skillstext: String?

        if(!lifeClass.newSkills!.isEmpty) {
            skillstext = "Cool Fact:\n"
        } else {
            skillstext = ""
        }

        cell.descriptionLife.text = lifeClass.descriptionLife! + "\n\n" + skillstext! + lifeClass.newSkills!

        let color = getColorBySection(indexPath.section)
        cell.backgroundColor = color

        if(indexPath.section == 1) {
            showButton(cell, Show: true, buttonName: "About me")
        } else {
            showButton(cell, Show: false, buttonName: "")
        }

        return cell
    }

    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let view = cell.contentView

        view.layer.opacity = 0.1
        
        UIView.animateWithDuration(1.5,
            delay: 0.0,
            options: UIViewAnimationOptions.AllowUserInteraction,
            animations: {
                view.layer.opacity = 1
            }, completion: nil
        )
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if(section != 0) {
            let header = view as! HeaderTableViewCell

            header.imageCell.layer.opacity = 0.1
            header.titleCell.layer.opacity = 0.1
            header.yearCell.layer.opacity = 0.1

            UIView.animateWithDuration(0.8,
                delay: 0.0,
                options: UIViewAnimationOptions.AllowUserInteraction,
                animations: {
                    header.imageCell.layer.opacity = 1
                    header.titleCell.layer.opacity = 1
                    header.yearCell.layer.opacity = 1
                    header.imageCell.transform = CGAffineTransformMakeTranslation(0, 20)
                    header.titleCell.transform = CGAffineTransformMakeTranslation(80, 0)
                    header.yearCell.transform = CGAffineTransformMakeTranslation(-80, 0)
                }, completion: nil
            )
        } else {
            let header = view as! HeaderDescription

            header.profileImage.layer.opacity = 0.1
            header.profileName.layer.opacity = 0.1
            header.profileAge.layer.opacity = 0.1
            
            UIView.animateWithDuration(0.8,
                delay: 0.0,
                options: UIViewAnimationOptions.AllowUserInteraction,
                animations: {
                    header.profileImage.layer.opacity = 1
                    header.profileName.layer.opacity = 1
                    header.profileAge.layer.opacity = 1
                    header.profileImage.transform = CGAffineTransformMakeTranslation(0, 20)
                    header.profileName.transform = CGAffineTransformMakeTranslation(80, 0)
                    header.profileAge.transform = CGAffineTransformMakeTranslation(-80, 0)
                }, completion: nil
            )
        }
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.section == 1) {
            self.performSegueWithIdentifier("contactSegue", sender: self)
        } 
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.section == 0) {
            return self.view.frame.size.height-150
        } else {
            return self.view.frame.size.height-100
        }
    }

    func insertData() {
        var header = ["Title":"Adil Sikander Virani","Year":"","Description":"I started off with a MacBook Air. My first line of code was written in Objective-C. I start the day off with an Apple. My life has been made through my coding lifestyle. Coding iOS starting 9th grade and learning Web Development has helped me provide for my education, along with my family for quite a while. I was blessed to learn these things as such a young age and it has allowed me to meet many people and has helped me learn so much. Let's begin.. ", "Icon":"profile-draw", "newSkills": ""]
        
        var one = ["Title":"Born","Year":"1997","Description":"I was born in Dallas, Texas USA. \n September 9th, 1997.", "Icon":"born-icon", "newSkills": "Six years ago my birthday was 9/9/9"]
        
        var two = ["Title":"My Hello World","Year":"2011","Description":"I was 13 years old when I wrote my first line of code in Objective-C. My life has revolved around code ever since. My family went bankrupt 2 days after my 14th birthday. It really didn't affect me because at the time there was nothing I could do and money wasn't really a big issue for me, but it was for my parents. One day, my friend asked me to go to a hackathon with him, at the time I thought a Hackathon was a place for free food and a place to code. That all changed as the slow night passed by. Hours after hours of drinking apple juice and eating chipotle. I actually made something the compiled all my knowledge of a years worth of Objective-C coding. I had made an itinerary maker! Well long story short, I actually ended up winning the Hackathon allowing me to take home $7,500 for my family. Here's the catch...it didn't end there the hacking continued. ", "Icon":"start_it", "newSkills": "I have won a total of 7 hackathons. Money 20/20 @ Vegas, Capital One Hackathon, Hack@Brown, HackDFW, Sabre Hackathon, NTx Hackathon, and BitHack."]
        
        var three = ["Title":"Learning Development","Year":"2011","Description":"Starting in 9th Grade I learned how to create Mobile applicaitons using Native Objective-C code. I simply began by reading Apple's Objective-C docs. I learned more iOS as the years went by and as I continued going to more Hackathons. In 2013 I began learning front-end for Web-Development soon that turned into me becoming a Full Stack Web Developer now I had the best of both Mobile and Web worlds. HTML/CSS/JavaScript/Objective-C", "Icon":"it_real_90", "newSkills": "My mom used to say I looked like a bug when I read docs because my eyes turned really red :)"]
        
        var four = ["Title":"First Job","Year":"2014","Description":"In 2011 I was hired by broadlinkone, a company sponsored by AT&T around my area. This is where I fully honed my Web Development Skills. With a new task every Tuesday and Thursday I managed to work well with the tight deadlines and hardly little direction. I created several web pages that required varies coding for brodlinkone. I really liked the people I worked with and it was fun working with them. Unfortunatley broadlinkone shut down last year so I lost my source of income to provide for my family. But then I met Hackathons.", "Icon":"job_1", "newSkills": "Julie Simon my co-worker, loves coffee everyday I'd make her 1 cup with 1 sugar and 3 french vanilla creamers."]
        
        var five = ["Title":"The High School 'Dropout'","Year":"2014","Description":"There's only one way to leave High School and that's going to college that was my goal. I left High School in 10th grade to go to UNT through a Texas only program called TAMS. The Texas Academy of Mathematics and Science is a program for high school Texas students. In order to get in we have to go through a interview process along with a couple of placement tests. Luckily I made it and was known as the 'High School Dropout'. I began looking at the courses that UNT had to offer...none of them were even close to the development I had imagined they required no imagination no actual real life skill. I hope that after TAMS I could make it to UC Berkley or Stanford to experience the California lifestyle and actually pursue the start up lifestyle.", "Icon":"web", "newSkills": "We're required to take 21 credit hours a semester."]
        
        var six = ["Title":"TAMS","Year":"2014-15","Description":"There are many things that I have learned by just being here for a year. One thing, people are not who they seem. Some will always be by you some won't. Not only have I learned the skills for Academia, but I have also learned how people's mind works in life and how people think and how their actions represent their qualities. I have also learned how hard it is to be in college and pay for education at the same time is. I picked up on multiple freelance opportunities, along with creating an iOS app for Nintentdo. There have been a lot of challenges I have faced in just one year of TAMS, I have learned so much and I hope to countinue this journey to the end. Learning more and hopefully getting enough money to help my parents and pay for my own education.", "Icon":"college", "newSkills": "You need above a 3.0 GPA in order to stay at TAMS, or you get kicked out."]
        
        var seven = ["Title":"Current Job","Year":"2014","Description": "I have no current job. My job changes every day, sometimes every month. I make a decent amount a week and I have learned how everyone I work for has different mind and how to act and be a bright developer by listening to what clients want exactly, along with executing tasks as efficiently as possible. This summer I will have an upcoming job at Dropbox for 2 months. Then for the 3rd month of my summer, I will be at Brown University doing research for Dr.Andries Van Dam.", "Icon":"creative", "newSkills": "Dr.Van Dam is the 2nd PhD in Computer Science in the World."]
        
        var eight = ["Title":"iOS\nDevelopment","Year":"2015","Description":"My iOS development skills decayed as soon as I picked up web development. This January I started picking up Swift and Objective-C again. It's been quite a ride with me and my Mac. Recently I had to say goodbye to this old Macbook Air and say hello to my new Macbook Pro. Because I compiled all my iOS knowledge to create an app at Hack@Brown, I won best mobile app and won a Mackbook Pro. This was so exciting for me and allowed me to land a job at Dropbox.", "Icon":"ios", "newSkills": "At Hack@Brown, I got introduced to Parse and it changed my life forever."]
        
        var nine = ["Title":"Conclusion","Year":"","Description":"Development will continue for as long as I live. I hope to continue working as hard as I can to make enough money and help my parents. I hope to change the world one day with my development skills and allow the world to see how the term 'Hacker' is not a negative connotation on people who code. I hope to one day get a job at Apple and change the community at Apple too because I want the company I work for to be something amazing. If I had to tell you something that was consistant about everyone I've worked for--not to be cocky--it would be that all of them say that I am a good listener. This key skill will allow me to hone all of the knowledge I have listened to and compile them all allowing me to print the best person I can be.", "Icon":"conclusion", "newSkills": ""]

        history = [header, one, two, three, four, five, six, seven, eight, nine]
    }

    func getColorBySection(section: Int) -> UIColor {
        var color: UIColor?

        if(section == 0){
            color = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        } else if(section == 1) {
            color = UIColor(red: 255.0/255.0, green: 110.0/255.0, blue: 221.0/255.0, alpha: 1.0)
        } else if(section == 2) {
            color = UIColor(red: 255.0/255.0, green: 85.0/255.0, blue: 96.0/255.0, alpha: 1.0)
        }else if(section == 3) {
            color = UIColor(red: 255.0/255.0, green: 133.0/255.0, blue: 79.0/255.0, alpha: 1.0)
        }else if(section == 4) {
            color = UIColor(red: 255.0/255.0, green: 193.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        }else if(section == 5) {
            color = UIColor(red: 48.0/255.0, green: 226.0/255.0, blue: 208.0/255.0, alpha: 1.0)
        }else if(section == 6) {
            color = UIColor(red: 4.0/255.0, green: 106.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        }else if(section == 7) {
            color = UIColor(red: 149.0/255.0, green: 23.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        }else if(section == 8) {
            color = UIColor(red: 221.0/255.0, green: 47.0/255.0, blue: 247.0/255.0, alpha: 1.0)
        } else if(section == 9) {
            color = UIColor(red: 31.0/255.0, green: 2.0/255.0, blue: 68.0/255.0, alpha: 1.0)
        }

        return color!
    }
    
    func showButton(cell: LifeTableViewCell, Show: Bool, buttonName: String) {
        cell.viewButton.layer.cornerRadius = 6;
        cell.viewButton.clipsToBounds = true;
        let bordercolor = UIColor.whiteColor()
        cell.viewButton.layer.borderColor = bordercolor.CGColor
        cell.viewButton.layer.borderWidth = 1.7

        cell.labelButton.text = buttonName

        if(Show == true) {
            cell.viewButton.hidden = false
            cell.labelButton.hidden = false
        } else {
            cell.viewButton.hidden = true
            cell.labelButton.hidden = true
        }
    }

    func buttonScrollDown (cell: LifeTableViewCell) {
        cell.arrowDown.hidden = false
        let options = UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat | UIViewAnimationOptions.CurveEaseInOut
        
        UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
            cell.arrowDown.transform = CGAffineTransformMakeTranslation(0, 16)
        }, completion: nil)
    }
}
