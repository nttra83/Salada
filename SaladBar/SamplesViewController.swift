//
//  SamplesViewController.swift
//  SaladBar
//
//  Created by 1amageek on 2017/08/04.
//  Copyright © 2017年 Stamp. All rights reserved.
//

import UIKit

class SamplesViewController: UITableViewController {

    enum Sample: String {
        case simple     = "Simple Model"
        case relation   = "Relation"
        case dataSource = "DataSource(TableView or CollectionView)"
        case allUsers   = "Get all users"
        case file       = "Upload Image file"
        case growth     = "Growth Property handle"
        case property   = "Growth Relation"

        static var values: [Sample] {
            return [.simple, .relation, .dataSource, .allUsers, .file, .growth, .property]
        }
    }

    convenience init() {
        self.init(style: .plain)
    }

    override init(style: UITableViewStyle) {
        super.init(style: style)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Sample.values.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let sample: Sample = Sample.values[indexPath.item]
        cell.textLabel?.text = sample.rawValue
        cell.textLabel?.setNeedsLayout()
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sample: Sample = Sample.values[indexPath.item]
        switch sample {
        case .simple:
            let storyboard: UIStoryboard = UIStoryboard(name: "SimpleModelViewController", bundle: nil)
            let viewController: SimpleModelViewController = storyboard.instantiateInitialViewController() as! SimpleModelViewController
            self.navigationController?.pushViewController(viewController, animated: true)
        case .relation:
            let storyboard: UIStoryboard = UIStoryboard(name: "UserGroupRelationViewController", bundle: nil)
            let viewController: UserGroupRelationViewController = storyboard.instantiateInitialViewController() as! UserGroupRelationViewController
            self.navigationController?.pushViewController(viewController, animated: true)
        case .dataSource:
            let viewController: DataSourceViewController = DataSourceViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        case . allUsers:
            let viewController: UserDataSourceViewController = UserDataSourceViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        case .file:
            let storyboard: UIStoryboard = UIStoryboard(name: "ImageUploadViewController", bundle: nil)
            let viewController: ImageUploadViewController = storyboard.instantiateInitialViewController() as! ImageUploadViewController
            self.navigationController?.pushViewController(viewController, animated: true)
        case .growth:
            let storyboard: UIStoryboard = UIStoryboard(name: "GrowthProperty", bundle: nil)
            let viewController: GrowthPropertyViewController = storyboard.instantiateInitialViewController() as! GrowthPropertyViewController
            self.navigationController?.pushViewController(viewController, animated: true)
        case .property:
            let storyboard: UIStoryboard = UIStoryboard(name: "RelationViewController", bundle: nil)
            let viewController: RelationViewController = storyboard.instantiateInitialViewController() as! RelationViewController
            self.navigationController?.pushViewController(viewController, animated: true)
        default: break
        }
    }
}
