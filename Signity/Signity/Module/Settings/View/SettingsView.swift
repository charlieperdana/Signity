//
//  SettingsView.swift
//  Signity
//
//  Created by Devina Ranlyca on 07/08/21.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var communityImage = ["LogoGerkatin","PUSBISINDO","BISINDO 2.0"]
    var name = ["GERKATIN","PUSBISINDO","BISINDO 2.0"]
    var headline = ["Gerakan untuk Kesejahteraan Tuna rungu Indonesia", "Wadah pembelajaran dan penelitian bahasa isyarat alamiah di Indonesia","Platform informasi keberagaman Bahasa Isyarat Indonesia."]
    var link = ["https://gerkatin.org/", "https://pusbisindo.org/","https://www.instagram.com/bisindo2.0/"]

    @StateObject var viewModel = SettingViewModel()
    
    var body: some View {
        NavigationView{
            List {
                Picker(selection: $viewModel.currentRegion, label: Text("Pilih Daerah BISINDO")){
                    ForEach(viewModel.daerah, id: \.self){
                        Text($0)
                    }
                }
                
                Section(
                    header: Text("Kontak Komunitas")
                        .modifier(SignityFootnote(color: .text))
                ){
                    Text("Hubungi kontak komunitas dibawah ini untuk mempelajari BISINDO lebih lanjut")
                        .modifier(SignityFootnote(color: .text))
                        .padding(.bottom, 10)
                        .padding(.top, 12)
                    ForEach(name.indices) { i in
                        CollectionView(communityImage:communityImage[i], name:name[i], headline:headline[i], link:link[i])
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Pengaturan", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Selesai")
                    .foregroundColor(Color("NavigationItem"))
            }))
        }
        .accentColor(Color("NavigationItem"))
    }
}
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
