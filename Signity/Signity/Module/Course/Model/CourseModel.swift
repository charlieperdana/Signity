//
//  CourseSection.swift
//  Signity
//
//  Created by charlie siagian on 06/08/21.
//

import Foundation


struct CourseSection {
    var name: String
    var item: [CourseItem]
}

struct CourseItem {
    var title: String
    var typeName: String
    var image: String
    var numExercise: Int
    var progress: Int
}

extension CourseSection {
    static var data: [CourseSection] {
        [
            CourseSection(name: "Fundamental", item: [
                            CourseItem(title: "Abjad", typeName: "Kata Dasar", image: "Abjad", numExercise: 26, progress: 10),
                            CourseItem(title: "Angka", typeName: "Kata Dasar", image: "Angka", numExercise: 20, progress: 2)]),
            CourseSection(name: "Menyapa", item: [
                            CourseItem(title: "Sapaan", typeName: "Kata Dasar", image: "Sapaan", numExercise: 5, progress: 2),
                            CourseItem(title: "Menanyakan Kabar", typeName: "Situasi", image: "TanyaKabar", numExercise: 2, progress: 1)]),
            CourseSection(name: "Perkenalan", item: [
                            CourseItem(title: "Nama", typeName: "Kata Dasar", image: "Nama", numExercise: 6, progress: 0),
                            CourseItem(title: "Kota", typeName: "Kata Dasar", image: "Kota", numExercise: 5, progress: 1),
                            CourseItem(title: "Bertemu Teman Baru", typeName: "Situasi", image: "TemuTemanBaru", numExercise: 2, progress: 0)])
            
        ]
    }
    static var dataItem: [CourseItem] {
        [
            CourseItem(title: "Abjad", typeName: "Kata Dasar", image: "abc", numExercise: 26, progress: 0),
            CourseItem(title: "Angka", typeName: "Kata Dasar", image: "abc", numExercise: 20, progress: 0),
            CourseItem(title: "Sapaan", typeName: "Kata Dasar", image: "abc", numExercise: 5, progress: 0),
            CourseItem(title: "Menanyakan Kabar", typeName: "Situasi", image: "abc", numExercise: 2, progress: 0)
        ]
    }
}
