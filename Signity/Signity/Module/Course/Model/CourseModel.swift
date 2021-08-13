//
//  CourseSection.swift
//  Signity
//
//  Created by charlie siagian on 06/08/21.
//

import Foundation

struct Region {
    var name: String
    var categories: [ModuleCategory]
}

struct ModuleCategory {
    var name: String
    var modules: [Module]
}

struct Module {
    var code: String
    var title: String
    var type: String
    var level: Int16
    var submodules: [SubModules]
}

struct SubModules {
    var name: String
    var wordParts: [String]?
}

struct AvailableCourses {
    static let regions: [Region] = [
        Region(
            name: "Jakarta",
            categories: [
                ModuleCategory(
                    name: "Fundamental",
                    modules: [
                        Module(
                            code: "FUN001",
                            title: "Abjad",
                            type: "Kata Dasar",
                            level: 0,
                            submodules: [
                                SubModules(name: "A"), SubModules(name: "B"),
                                SubModules(name: "C"), SubModules(name: "D"),
                                SubModules(name: "E")
                            ]
                        ),
                        Module(
                            code: "FUN002",
                            title: "Angka",
                            type: "Kata Dasar",
                            level: 0,
                            submodules: [
                                SubModules(name: "0"), SubModules(name: "1"),
                                SubModules(name: "2"), SubModules(name: "3"),
                                SubModules(name: "4"), SubModules(name: "5")
                            ]
                        ),
                    ]
                ),
                ModuleCategory(
                    name: "Menyapa",
                    modules: [
                        Module(
                            code: "MEN001",
                            title: "Sapaan",
                            type: "Kata Dasar",
                            level: 0,
                            submodules: [
                                SubModules(name: "Selamat siang"),
                                SubModules(name: "Selamat siang"),
                                SubModules(name: "Hallo"),
                                SubModules(name: "Hey")
                            ]
                        ),
                        Module(
                            code: "MEN002",
                            title: "Menanyakan Kabar",
                            type: "Situasi",
                            level: 0,
                            submodules: [
                                SubModules(
                                    name: "Halo, selamat siang",
                                    wordParts: ["Halo", "Selamat siang"]
                                ),
                                SubModules(
                                    name: "Selamat Siang",
                                    wordParts: ["Selamat siang"]
                                ),
                                SubModules(
                                    name: "Apa kabar?",
                                    wordParts: ["Apa kabar"]
                                ),
                                SubModules(
                                    name: "Aku sakit",
                                    wordParts: ["Aku", "Sakit"]
                                )
                            ]
                        )
                    ]
                ),
                ModuleCategory(
                    name: "Perkenalan",
                    modules: [
                        Module(
                            code: "PER001",
                            title: "Nama",
                            type: "Kata Dasar",
                            level: 1,
                            submodules: [
                                
                            ]
                        ),
                        Module(
                            code: "PER002",
                            title: "Kota",
                            type: "Kata Dasar",
                            level: 2,
                            submodules: [

                            ]
                        ),
                        Module(
                            code: "PER003",
                            title: "Bertemu Teman Baru",
                            type: "Situasi",
                            level: 2,
                            submodules: [
                                
                            ]
                        ),
                    ]
                )
            ]
        ),
        
        Region(
            name: "Denpasar",
            categories: [
                ModuleCategory(
                    name: "Fundamental",
                    modules: [
                        Module(
                            code: "FUN001",
                            title: "Abjad",
                            type: "Kata Dasar",
                            level: 0,
                            submodules: [
                                SubModules(name: "A"), SubModules(name: "B"),
                                SubModules(name: "C"), SubModules(name: "D"),
                                SubModules(name: "E")
                            ]
                        ),
                        Module(
                            code: "FUN002",
                            title: "Angka",
                            type: "Kata Dasar",
                            level: 0,
                            submodules: [
                                SubModules(name: "0"), SubModules(name: "1"),
                                SubModules(name: "2"), SubModules(name: "3"),
                                SubModules(name: "4"), SubModules(name: "5")
                            ]
                        ),
                    ]
                ),
            ]
        )
    ]
}
