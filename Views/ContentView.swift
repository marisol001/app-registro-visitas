//
//  ContentView.swift
//  visitas
//
//  Created by Marisol Reyes Espino on 08/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var searchText = ""
    @State var isSearching = false
    @State var isShowingDetailView = false
    let visitors = [
        Visitor(id: 1, name: "Marisol", avatar: Image(systemName: "person"), date: "20 June", address: "Mexico City", hour: "2:20", typeVisit: "Duda"),
        Visitor(id: 2, name: "Reyes", avatar: Image(systemName: "person.fill"), date: "20 June", address: "Mexico City", hour: "2:20", typeVisit: "Duda"),
        Visitor(id: 4, name: "Espino", avatar: Image(systemName: "person.circle.fill"), date: "20 June", address: "Mexico City", hour: "2:20", typeVisit: "Duda"),
        Visitor(id: 5, name: "Espino", avatar: Image(systemName: "person.circle.fill"), date: "20 June", address: "Mexico City", hour: "2:20", typeVisit: "Duda"),
        Visitor(id: 6, name: "Espino", avatar: Image(systemName: "person.circle.fill"), date: "20 June", address: "Mexico City", hour: "2:20", typeVisit: "Duda")
    ]
    @State private var boolArr = [false, false, true, true, false]
    let fruits = ["Apple", "Pear", "Orange"]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    SearchBar(searchText: $searchText, isSearching: $isSearching)
                    ForEach(visitors, id: \.id) {
                        visitor in
                        HStack {
                            visitor.avatar
                                .resizable()
                                .frame(width: 40, height: 40)
                                .padding(15)
                                .background(Color.gray)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                            VStack(alignment: .leading) {
                                Text(visitor.name)
                                    .font(.body).bold()
                                Text("Motivo de Visita:")
                                Text(visitor.typeVisit)
                                    .font(.subheadline)
                            }
                            Spacer()
                            Text(visitor.hour)
                                .font(.subheadline)
                            
                            Menu {
                                Button("Eliminar", action: placeOrder)
                                Button("Enviar datos al servidor", action: {
                                    
                                })
                            }
                            label: {
                                Label("", systemImage: "chevron.right")
                            }
                        }.padding(.init(top: 10, leading: 15, bottom: 0, trailing: 10))
                        Divider()
                    }
                    
                    ButtonFAB(isShowingDetailView: $isShowingDetailView)
                }
                
                
            }.navigationTitle("Visitas")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool
    
    var body: some View {
        HStack {
            HStack {
                TextField("Buscar", text: $searchText)
                    .padding(.leading, 24)
                    .padding(.trailing, 24)
            }
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(10)
            .padding(.horizontal)
            .onTapGesture(perform: {
                isSearching = true
            })
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    if isSearching {
                        Button(action: {
                            searchText = ""
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .padding(.vertical)
                        })
                    }
                }.padding(.horizontal, 32)
                .foregroundColor(.gray)
            ).transition(.move(edge: .trailing))
            .animation(.spring())
            
            if isSearching {
                Button(action: {
                    isSearching = false
                    searchText = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }, label: {
                    Text("Cancel")
                        .padding(.trailing)
                        .padding(.leading, 0)
                })
                .transition(.move(edge: .trailing))
                .animation(.spring())
            }
        }
    }
}

struct ButtonFAB: View {
    @Binding var isShowingDetailView: Bool
    var body: some View {
        ZStack {
            Spacer()
            NavigationLink(
                destination: RegisterView(),
                label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color.orange)
                }).navigationTitle("Visitas")
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            
        }
    }
}
