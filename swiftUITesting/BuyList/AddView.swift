//
//  AddView.swift
//  swiftUILessonX
//
//  Created by Mac on 12.02.2022.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expenses
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    let types = ["Домашние", "Персональные", "Бизнес"]
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Название", text: $name)
                Picker("Тип", selection: $type) {
                    ForEach(self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Стоимость", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Добавляем")
            .navigationBarItems(trailing: Button("Сохранить"){
                if let actualAmount = Int(self.amount) {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
