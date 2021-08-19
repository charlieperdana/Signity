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
                                SubModules(name: "E"), SubModules(name: "F"),
                                SubModules(name: "G"), SubModules(name: "H"),
                                SubModules(name: "I"), SubModules(name: "J"),
                                SubModules(name: "K"), SubModules(name: "L"),
                                SubModules(name: "M"), SubModules(name: "N"),
                                SubModules(name: "O"), SubModules(name: "P"),
                                SubModules(name: "Q"), SubModules(name: "R"),
                                SubModules(name: "S"), SubModules(name: "T"),
                                SubModules(name: "U"), SubModules(name: "V"),
                                SubModules(name: "W"), SubModules(name: "X"),
                                SubModules(name: "Y"), SubModules(name: "Z"),
                            ]
                        ),
                        Module(
                            code: "FUN002",
                            title: "Angka",
                            type: "Kata Dasar",
                            level: 0,
                            submodules: [
                                SubModules(name: "10"), SubModules(name: "1"),
                                SubModules(name: "2"), SubModules(name: "3"),
                                SubModules(name: "4"), SubModules(name: "5"),
                                SubModules(name: "6"), SubModules(name: "7"),
                                SubModules(name: "8"), SubModules(name: "9")
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
                                SubModules(name: "Halo"),
                                SubModules(name: "Sehat"),
                                SubModules(name: "Apa kabar"),
                                SubModules(name: "Aku sakit"),
                                SubModules(name: "Selamat pagi"),
                                SubModules(name: "Selamat siang"),
                                SubModules(name: "Selamat sore"),
                                SubModules(name: "Selamat malam"),
                                SubModules(name: "Selamat datang")
                            ]
                        ),
                        Module(
                            code: "MEN002",
                            title: "Orang",
                            type: "Kata Dasar",
                            level: 0,
                            submodules: [
                                SubModules(name: "Aku"),
                                SubModules(name: "Kamu"),
                                SubModules(name: "Dia"),
                                SubModules(name: "Kita"),
                                SubModules(name: "Mereka")
                            ]
                        ),
                        Module(
                            code: "MEN003",
                            title: "Menanyakan Kabar",
                            type: "Situasi",
                            level: 0,
                            submodules: [
                                SubModules(
                                    name: "Halo, selamat siang",
                                    wordParts: ["Halo", "Selamat siang"]
                                ),
                                SubModules(
                                    name: "Selamat siang",
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
                            level: 1000,
                            submodules: [
                                
                            ]
                        ),
                        Module(
                            code: "PER002",
                            title: "Kota",
                            type: "Kata Dasar",
                            level: 1000,
                            submodules: [

                            ]
                        ),
                        Module(
                            code: "PER003",
                            title: "Bertemu Teman Baru",
                            type: "Situasi",
                            level: 1000,
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
