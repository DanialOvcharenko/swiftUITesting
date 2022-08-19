//
//  BuyList.swift
//  swiftUILessonX
//
//  Created by Mac on 12.02.2022.
//

import SwiftUI


struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
    didSet {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(items){
            UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items){
                self.items = decoded
                return
            }
        }
    }
}

struct BuyList: View {
    
    @State private var showingAddExpense = false
    @ObservedObject var expenses = Expenses()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(expenses.items) { item in
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text("\(item.amount)грн")
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("Мои расходы")
            .navigationBarItems(trailing:
                Button(action: {
                self.showingAddExpense = true
            }){
                Image(systemName: "plus")
            }
            )
            .sheet(isPresented: $showingAddExpense){
                AddView(expenses: self.expenses)
            }
        }
    }
    func removeItems(as offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct BuyList_Previews: PreviewProvider {
    static var previews: some View {
        BuyList()
    }
}
