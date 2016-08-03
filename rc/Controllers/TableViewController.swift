import UIKit
import AVFoundation

class TableViewController: UITableViewController {

	var sectors = [String]()
	var callsHistory = [[RedConnectCallData]]()
	//var player = AVAudioPlayer()

	override func viewDidLoad() {
		(sectors, callsHistory) = RCHistory.getCallsHistoryWithSectors()
		super.viewDidLoad()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	//navigationBar
	override func viewDidAppear(animated: Bool) {
		let navigationBar = self.navigationController?.navigationBar
		navigationBar?.tintColor = UIColor.whiteColor()
		let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
		navigationBar?.titleTextAttributes = titleDict as? [String:AnyObject]
	}

	override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return sectors[section]
	}

	//количество ячеек
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return callsHistory.count
	}

	//количество ячеек в секторе
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return callsHistory[section].count
	}

	//сектор
	override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

		let label = UILabel()

		label.frame = CGRect(x: 17, y: -5, width: 320, height: 40)
		label.font = UIFont.systemFontOfSize(14)
		let labelBalance = UILabel()
		labelBalance.frame = CGRect(x: 160, y: 0, width: 150, height: 40)
		labelBalance.textColor = UIColor.darkGrayColor()
		labelBalance.font = UIFont.systemFontOfSize(12)
		labelBalance.text = "остаток: 30 звонков"
		label.addSubview(labelBalance)

		label.text = sectors[section]

		let headView = UIView()
		headView.addSubview(label)
		headView.alpha = 0.9
		headView.backgroundColor = UIColor.whiteColor()
		return headView
	}

	//заполнение
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

		//
		let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell

		cell.fill(callsHistory[indexPath.section][indexPath.row])

		return cell
	}

	//обработчик нажатия
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		let phoneNumber = callsHistory[indexPath.section][indexPath.row].visitorPhone
		if let url = NSURL(string: "tel://+\(phoneNumber)") {
			print(url.absoluteString)
			UIApplication.sharedApplication().openURL(url)
			tableView.deselectRowAtIndexPath(indexPath, animated: true)
		}
	}

	//меню ячейки
	override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
		//Social
		let infoAction = UITableViewRowAction(style: .Default, title: "ИНФО", handler: {
			(actin, indexPath) -> Void in
			print("Информация")
		})

		//Ban
		let banAction = UITableViewRowAction(style: .Default, title: "БАН", handler: {
			(actin, indexPath) -> Void in
			print("Пользователь забанен")
		})

		infoAction.backgroundColor = UIColor(red: 28.0 / 255.0, green: 165.0 / 255.0, blue: 253.0 / 255.0, alpha: 1.0)
		banAction.backgroundColor = UIColor(red: 202.0 / 255.0, green: 202.0 / 255.0, blue: 203.0 / 255.0, alpha: 1.0)

		return [banAction, infoAction]
	}

	//переход
	@IBAction func segueSignOutAction(sender: AnyObject) {
		self.performSegueWithIdentifier("segueSignOut", sender: nil)
	}


	@IBAction func openWebChat(sender: AnyObject) {
		UIApplication.sharedApplication().openURL(NSURL(string: "http://rhlp.net/rhlp?page=http%3A%2F%2Fredhelper.ru%2F")!)
	}

}