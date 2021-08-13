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
                                SubModules(name: "Halo, selamat siang"),
                                SubModules(name: "Selamat Siang"),
                                SubModules(name: "Apa kabar?"),
                                SubModules(name: "Aku sakit")
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








struct CourseSection {
    var name: String
    var item: [CourseItem]
}

struct CourseItem {
    var title: String
    var typeName: String
    var image: String
    var imageDisable: String
    var numExercise: Int
    var progress: Int
    var isLock: Bool
    
}

extension CourseSection {
    static var data: [CourseSection] {
        [
            CourseSection(name: "Fundamental", item: [
                            CourseItem(title: "Abjad", typeName: "Kata Dasar", image: "Abjad", imageDisable: "" ,numExercise: 26, progress: 10, isLock: false),
                            CourseItem(title: "Angka", typeName: "Kata Dasar", image: "Angka", imageDisable: "", numExercise: 20, progress: 2, isLock: false)]),
            CourseSection(name: "Menyapa", item: [
                            CourseItem(title: "Sapaan", typeName: "Kata Dasar", image: "Sapaan",imageDisable: "", numExercise: 5, progress: 2, isLock: false),
                            CourseItem(title: "Menanyakan Kabar", typeName: "Situasi", image: "TanyaKabar", imageDisable: "TanyaKabarGrey", numExercise: 2, progress: 1, isLock: false)]),
            CourseSection(name: "Perkenalan", item: [
                            CourseItem(title: "Nama", typeName: "Kata Dasar", image: "Nama", imageDisable: "NamaGrey", numExercise: 6, progress: 0, isLock: true),
                            CourseItem(title: "Kota", typeName: "Kata Dasar", image: "Kota",imageDisable: "KotaGrey", numExercise: 5, progress: 1, isLock: true),
                            CourseItem(title: "Bertemu Teman Baru", typeName: "Situasi", image: "TemuTemanBaru",imageDisable: "TemuTemanBaruGrey", numExercise: 2, progress: 0, isLock: true)])
            
        ]
    }
    static var dataItem: [CourseItem] {
        [
            CourseItem(title: "Abjad", typeName: "Kata Dasar", image: "abc",imageDisable: "", numExercise: 26, progress: 0, isLock: false),
            CourseItem(title: "Angka", typeName: "Kata Dasar", image: "abc",imageDisable: "", numExercise: 20, progress: 0, isLock: false),
            CourseItem(title: "Menanyakan Kabar", typeName: "Situasi", image: "abc",imageDisable: "", numExercise: 2, progress: 0, isLock: false)
        ]
    }
}
