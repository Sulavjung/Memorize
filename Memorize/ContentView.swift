//
//  ContentView.swift
//  Memorize
//
//  Created by Sulav Jung Hamal on 12/22/23.
//



import SwiftUI
import SwiftData

struct ContentView: View {
    
    
    //Some view here means that: The compiler will get the computed value and determine which view it is and assign it appropriate view to the var body.
    //WHy var body? -> This is required field of the View protocol. That is why we should have the var body of some view in the ContentView here.
    //Some view allow us to have a complex view using other view. It is like lego and that is possible until and unless the return is some view.
    var body: some View {           //The curly braces starting here to the end of it is called computed properties.
        
        
        
        //====Creating instance of structs:=====
        //This is perfect example. The Image and Test. On Image we use the Image and in the (parameters goes here).
        //Parameter Defaults:
        //What about the VStack then? -> Why does the VStack don't have the open parameter and something? The thing is it could have. So, having no argument doesn't always meant you can do VStack just that. You have to have VStack() like that.
        //But then Why VStack got the curly braces things below? -> These things in curly braces are actually ====EMBEDED FUNCTIONS==== that are being passed as parameter. What we are actually doing is: VStack(content: { this }) but simplified to this view.
        //Then what are those .imageScale and .foregroundColor. Those are function related to structs. We call those functions like that on structs. Those are also called =====VIEW MODIFIER====. Those could be chained and each function returns a view and then that view is then further modified with the modifier.
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.orange)
            Text("Hello World!")
        }
        .padding()
    }

    
}

#Preview {
    ContentView()
}
