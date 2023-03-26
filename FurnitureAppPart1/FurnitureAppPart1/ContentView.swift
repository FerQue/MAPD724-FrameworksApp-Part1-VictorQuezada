//
//  ContentView.swift
//  FurnitureAppPart1
//
//  Created by Victor Quezada on 2023-03-25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedIndex: Int = 0
    private let categories = ["All", "Chairs", "Lamps", "Table", "Cabinets"]
    var body: some View {
        VStack {
            ZStack {
                Color(red: 190/255, green: 188/255, blue:196/255)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack (alignment: .leading) {
                        AppBarView()
                        
                        TagLineView()
                            .padding()
                        
                        SearchView()
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< categories.count) { i in
                                    CategoryView(isActive: i == selectedIndex, text: categories[i])
                                        .onTapGesture {
                                            selectedIndex = i
                                        }
                                }
                            }
                            .padding()
                        }
                        
                        Text ("Regular")
                            .font(.custom("LibreBaskerville-Italic", size: 24))
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 4) { index in
                                    CardView(image: Image("chair_\(index + 1)"),
                                             size: 210)
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        
                        Text ("Best")
                            .font(.custom("LibreBaskerville-Italic", size: 24))
                            .padding(.horizontal)
                            .padding(.top)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 4) { index in
                                    CardView(image: Image("furniture_\(index + 1)"),
                                             size: 180)
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        
                        
                    
                    }
                }
                
                //Navigation Bar
                
                HStack {
                    BottomNavBarItem(image: Image("home_7")) {}
                    BottomNavBarItem(image: Image("fav_1")) {}
                    BottomNavBarItem(image: Image("car_1")) {}
                    BottomNavBarItem(image: Image("user_3")) {}
                }
                .padding()
                .background(Color.white)
                .clipShape(Capsule())
                .padding(.horizontal)
                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 2, y: 6)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AppBarView: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image("menu_1")
                    .padding()
                    .backgroundStyle(Color(.white))
                    .cornerRadius(10.0)
                Spacer()
            }
        }
    }
}

struct TagLineView: View {
    var body: some View {
        Text("FAKEA")
            .font(.custom("LibreBaskerville-Bold", size: 30))
            .foregroundColor(Color.black)
    }
}

struct SearchView: View {
    @State private var search: String = ""
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search Furniture", text: $search)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.horizontal)
        }
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color.black: Color.black.opacity(0.5))
            
            if (isActive) {
                Color.black
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct CardView: View {
    let image: Image
    let size: CGFloat
    var body: some View {
        VStack {
            
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            
            Text("Canadian chair")
                .font(.title3)
                .fontWeight(.bold)
            
            HStack (spacing: 2) {
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Image("star")
                }
                
                Spacer()
                
                Text("$800")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
    }
}

struct BottomNavBarItem: View {
    let image: Image
    let action: ()-> Void
    var body: some View {
        Button(action: action, label: {
            image
                .frame(maxWidth: .infinity)
        })
    }
}
