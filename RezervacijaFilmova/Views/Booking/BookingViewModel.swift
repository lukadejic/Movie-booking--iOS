
import Foundation
import SwiftUI

class BookingViewModel : ObservableObject {
    
    @Published 
    var isDateSelected: Bool = false
    @Published
    var isTimeSelected: Bool = false
    @Published
    var movies: [Movie] = []
    @Published
    var isSelectedTime1 : Bool = false
    @Published
    var isSelectedTime2 : Bool = false
    @Published
    var isSelectedTime3 : Bool = false
    @Published
    var isSelectedTime4 : Bool = false
    @Published
    var isSelectedTime5 : Bool = false
    @Published
    var isSelectedDate1 = true
    @Published
    var isSelectedDate2 = true
    @Published
    var isSelectedDate3 = true
    @Published
    var isSelectedDate4 = true
    @Published
    var isSelectedDate5 = true

    struct DateData {
        var weekDay: String
        var numDay: String
        var isSelected: Bool
        var width: CGFloat
        var height: CGFloat
        var action: () -> Void
    }
    
    @Published var dates: [DateData] = [
           DateData(weekDay: "Pon", numDay: "20", isSelected: false, width: 50, height: 60, action: {}),
           DateData(weekDay: "Uto", numDay: "21", isSelected: false, width: 50, height: 60, action: {}),
           DateData(weekDay: "Sre", numDay: "22", isSelected: false, width: 50, height: 60, action: {}),
           DateData(weekDay: "Cet", numDay: "23", isSelected: false, width: 50, height: 60, action: {}),
           DateData(weekDay: "Pet", numDay: "24", isSelected: false, width: 50, height: 60, action: {})
       ]
    
    func toggleDateSelection(index: Int) {
        withAnimation(.spring()) {
            dates[index].isSelected.toggle()
        }
    }
    
//    init(){
//        generateDateInfos()
//    }
//
////    private func generateDateInfos() {
////        let dates = [("Pon", "20"), ("Uto", "21"), ("Sre", "22"), ("Cet", "23"), ("Pet", "24")]
////        
////        for(weekDat, numDay) in dates {
////            let dateInfo = DateInfo(weekDat: weekDat, numDay: numDay, isSelected: false)
////            dateInfos.append(dateInfo)
////        }
////    }
//    
//    func toggleSelectedState (for dateInfo: DateInfo) {
//        if let index = dateInfos.firstIndex(where: { $0 == dateInfo }) {
//            dateInfos[index].isSelected.toggle()
//        }
//    }
//    
    
}
