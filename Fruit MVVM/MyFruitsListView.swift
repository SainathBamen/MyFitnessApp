//
//  MyFruitsListView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 15/06/25.
//



import SwiftUI

//struct MyFruits: Codable, Identifiable {
//    let id: Int
//    let name: String
//    let description: String
//    let fruitImg: String
//
//    enum CodingKeys: CodingKey {
//        case id
//        case name
//        case description
//        case fruitImg
//    }
//}


//class DataLoader {
//    static func loadFruits() -> [MyFruits] {
//        guard let url =  Bundle.main.url(forResource: "MockData", withExtension: "json"),
//              let data = try? Data(contentsOf: url),
//              let fruits = try? JSONDecoder().decode([MyFruits].self, from: data)
//               else {
//            return []
//        }
//        return fruits
//    }
//}




import SwiftUI

struct MyFruitsListView: View {
    @StateObject private var viewModel = MyFruitViewModel()
    @State private var selectedFruit: MyFruits? = nil  // selected fruit state
    
    var body: some View {
        NavigationStack {
            List(viewModel.fruits) { fruit in
                HStack(spacing: 14) {
                    Image(fruit.fruitImg)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(radius: 2)

                    VStack(alignment: .leading, spacing: 6) {
                        Text(fruit.name)
                            .font(.headline)
                        Text(fruit.description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(2)
                    }
                }
                .padding(.vertical, 8)
                .onTapGesture {
                    selectedFruit = fruit  // open sheet with this fruit
                }
            }
            .navigationTitle("🍎 Fruits List")
        }
        .sheet(item: $selectedFruit) { fruit in
            FruitDetailSheetView(fruit: fruit)
                .presentationDetents([.medium]) // half sheet
        }
    }
}

struct FruitDetailSheetView: View {
    let fruit: MyFruits
    
    var body: some View {
        VStack(spacing: 20) {
            Image(fruit.fruitImg)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(radius: 5)
            
            Text(fruit.name)
                .font(.title.bold())
            
            Text(fruit.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    MyFruitsListView()
}
