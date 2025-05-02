//
//  Menu.swift
//  App
//
//  Created by Matija Radinovic on 29.4.25..
//

import SwiftUI
import CoreData

struct MenuView: View {
    @ObservedObject var viewModel: MenuViewModel
    @Environment(\.managedObjectContext) var viewContext
    @State private var isSearchPresented = false

    var body: some View {
        presentationView
    }

    var presentationView: some View {
        VStack {
            headerView

            heroView
            
            Text("ORDER FOR DELIVERY!")
                .font(Font.sectionTitle)
            
            menuCategories

            FetchedObjects(predicate: viewModel.predicate,
                           sortDescriptors: viewModel.sortDescriptors) { (dishes: [Dish]) in
                List {
                    ForEach(dishes) { dish in
                        HStack {
                            Text("Dish: \(dish.title ?? "") \n \(dish.price ?? "") $")
                            Spacer()
                            AsyncImage(url: URL(string: dish.image ?? ""))
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
        .keyboardDismissable()
        .padding(.horizontal)
        .navigationBarBackButtonHidden()
        .onAppear {
            viewModel.getMenuData()
        }
    }
    
    var headerView: some View {
        HStack {
            Spacer()

            Image("logo")

            Spacer()

            Button(action: {
                viewModel.navigateToProfile()
            }) {
                Image("profileImage")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
        }
    }

    var heroView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Little Lemon")
                .font(Font.displayTitle)
                .foregroundColor(Color.accentYellow)

            HStack {
                VStack(alignment: .leading) {
                    Text("Chicago")
                        .font(Font.displaySubTitle)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 10)

                    Text("We are family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .padding(.trailing, 20)
                        .font(Font.leadText)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.bottom, 12)

                Image("Heroimage")
                    .resizable()
                    .frame(width: 130, height: 130)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }

            HStack {
                if isSearchPresented {
                    TextField("Search menu", text: $viewModel.searchText)
                        .textFieldStyle(SearchTextfieldStyle())
                        .transition(.move(edge: .leading))
                }

                Button(action: {
                    viewModel.searchText = ""
                    withAnimation(.easeInOut(duration: 0.1)) {
                        isSearchPresented.toggle()
                    }
                }) {
                    Image(systemName: isSearchPresented ? "xmark" : "magnifyingglass")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .rotationEffect(.degrees(isSearchPresented ? 90 : 0))
                        .foregroundColor(Color.white)
                        .padding(12)
                        .background(Circle().fill(Color.lightGray))
                }
            }
        }
        .padding(10)
        .background(Color.primaryGreen)
    }
    
    var menuCategories: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(ItemCategory.allCases) { item in
                    categoryCell(category: item)
                }
            }
        }
    }
    
    @ViewBuilder
    func categoryCell(category: ItemCategory) -> some View {
        Text(category.rawValue)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .foregroundColor(category == viewModel.selectedCategory ? Color.accentYellow : Color.charcoalGray)
            .background(Capsule().fill(category == viewModel.selectedCategory ? Color.charcoalGray : Color.lightGray))
            .onTapGesture {
                viewModel.setCategory(category: category)
            }
    }
}


