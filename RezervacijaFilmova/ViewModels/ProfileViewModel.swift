
import SwiftUI

final class ProfileViewModel : ObservableObject {
    
    @Published var user = User()
    @AppStorage("user") var userData :Data?
    @Published var alertItem : AlertItem?
    
    func saveChanges() {
        
        guard isValidForm else {return}
        
        do{
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.savedChanges
        }catch{
           // alertItem = AlertContext.invalidUserData
        }
    }
    
    func retrieveUser(){
        guard let userData = userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch{
            //alertItem = AlertContext.invalidUserData
        }
    }

    private var isValidForm : Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty && !user.password.isEmpty else {
            
            alertItem = AlertContext.invalidForm
            
            return false
            
        }
        
        guard user.email.isValidEmail else{
            
            alertItem = AlertContext.invalidEmail
            
            
            return false
        }
        
        return true
    }
    
}

extension String {
    
    var isValidEmail: Bool {
        let emailFormat         = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate      = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
    
}
