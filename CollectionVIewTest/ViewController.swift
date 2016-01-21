//
//  ViewController.swift
//  CollectionVIewTest
//
//  Created by Zhao Wang on 1/21/16.

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        var contentInsetTop: CGFloat = 10
        #if os(iOS)
            let os = NSProcessInfo().operatingSystemVersion
            switch (os.majorVersion, os.minorVersion, os.patchVersion) {
            case (9, 0, _):
                print("iOS >= 9.0.0, < 9.1.0")
                // Only in iOS 9.0.x, the contentInset of the collection view does not automatically add the statusbar height and the navigation bar height
                let statusBarheight = UIApplication.sharedApplication().statusBarFrame.height
                let value = (self.navigationController?.navigationBar.frame.height ?? 0) + statusBarheight
                contentInsetTop = contentInsetTop + value
            default:
                print("iOS < 9.0.0 or >= 9.1.0")
            }
        #endif
        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: UICollectionViewFlowLayout())
        self.collectionView.contentInset = UIEdgeInsets(top: contentInsetTop, left: 0, bottom: 10, right: 0)
        self.collectionView.backgroundColor = UIColor.clearColor()
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false

        self.collectionView.autoresizingMask = .None
        self.view.addSubview(self.collectionView)
        self.view.addConstraint(NSLayoutConstraint(item: self.view, attribute: .Top, relatedBy: .Equal, toItem: self.collectionView, attribute: .Top, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.view, attribute: .Leading, relatedBy: .Equal, toItem: self.collectionView, attribute: .Leading, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.view, attribute: .Bottom, relatedBy: .Equal, toItem: self.collectionView, attribute: .Bottom, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.view, attribute: .Trailing, relatedBy: .Equal, toItem: self.collectionView, attribute: .Trailing, multiplier: 1, constant: 0))
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("Will Layout Subviews \(self.collectionView!.contentInset)")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("Did Layout Subviews \(self.collectionView!.contentInset)")
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("Will Appear: \(self.collectionView!.contentInset)")
    }


    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("Did Appear: \(self.collectionView!.contentInset)")
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return self.collectionView.dequeueReusableCellWithReuseIdentifier("hello", forIndexPath: indexPath)
    }
}

