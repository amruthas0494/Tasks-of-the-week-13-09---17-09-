//
//  CalendarDisplayViewController.swift
//  MyFirstProject
//
//  Created by apple on 04/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import FSCalendar

class CalendarDisplayViewController: UIViewController{
    
    
    @IBOutlet weak var displayCalendar: FSCalendar!
      fileprivate let gregorian: Calendar = Calendar(identifier: .gregorian)
    fileprivate lazy var dateFormatter: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateFormat = "dd/MM/yyyy"
           return formatter
       }()
    var datesArray = [String]()
    var multipleEventsArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.displayCalendar.dataSource = self
        self.displayCalendar.delegate = self
        let formatter = DateFormatter()
         datesArray = ["12/04/2019", "23/02/2021", "04/08/2021", "18/03/2021", "22/08/2021", "02/11/2021", "12/12/2021"]
         multipleEventsArray = ["23/02/2021", "04/08/2021", "18/03/2021","22/08/2021"]
       
    }
    

    

}

extension CalendarDisplayViewController : FSCalendarDataSource {
 
//    //Set Minimum Date
//    func minimumDate(for calendar: FSCalendar) -> Date {
//        return dateFormatter.date(from: "01/01/2000") ?? Date()
//    }
//
//    //Set maximum Date
//    func maximumDate(for calendar: FSCalendar) -> Date {
////          let dateFormatter = DateFormatter()
////          dateFormatter.dateFormat = "dd-mm-yyyy"
//        return dateFormatter.date(from: "27/10/2032") ?? Date()
//    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
      
       // dateFormatter.locale = Locale.init(identifier: "fa_IR")
        let dateString = self.dateFormatter.string(from: date)

           if self.datesArray.contains(dateString) {
               return 1
           }
           if self.multipleEventsArray.contains(dateString) {
               return 3
           }
           return 0
      
    }
    

    
}

extension CalendarDisplayViewController : FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
          print("did select date \(self.dateFormatter.string(from: date))")
          let selectedDates = calendar.selectedDates.map({self.dateFormatter.string(from: $0)})
          print("selected dates is \(selectedDates)")
          if monthPosition == .next || monthPosition == .previous {
              calendar.setCurrentPage(date, animated: true)
          }
      }

      func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
          print("\(self.dateFormatter.string(from: calendar.currentPage))")
      }
    
}
extension CalendarDisplayViewController : FSCalendarDelegateAppearance {
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventDefaultColorsFor date: Date) -> [UIColor]? {
         let key = self.dateFormatter.string(from: date)
           if self.multipleEventsArray.contains(key) {
               return [UIColor.cyan, appearance.eventDefaultColor, UIColor.black]
           }
            
           return nil
    }
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventSelectionColorsFor date: Date) -> [UIColor]? {
        let key1 = self.dateFormatter.string(from: date)
        if self.datesArray.contains(key1) {
            return [UIColor.red, appearance.eventSelectionColor, UIColor.black]
        }
        return nil
  }
}
