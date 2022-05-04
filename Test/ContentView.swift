//
//  ContentView.swift
//  Test
//
//  Created by 樋川裕次郎 on 2022/05/04.
//

import SwiftUI

struct ContentView: View {
    
    @State var numbers = [0,1,2,3,4,5]
    @State var onEdit = false
    var body: some View {
        VStack {
            //GeometryReaderでどの画面サイズにも対応できるように
            //使わなくてもいい
            GeometryReader { geo in
                List {
                    ForEach(numbers, id:\.self) { number in
                        Text(String(number))
                    }
                    .onMove(perform: move)
                    .deleteDisabled(true)
                    .listRowInsets(EdgeInsets(top: 0, leading: onEdit ? -(geo.size.width * 0.04) : geo.size.width * 0.066, bottom: 0, trailing: 0))
                }
                .environment(\.editMode, .constant(onEdit ? .active : .inactive))
            }
            Button {
                onEdit = !onEdit
            } label: {
                Text("Edit")
            }.padding()
        }
    }
    
    private func move(from source: IndexSet, to destinaiton: Int){
        numbers.move(fromOffsets: source, toOffset: destinaiton)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
