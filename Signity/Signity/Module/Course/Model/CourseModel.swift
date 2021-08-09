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
    var imageDisable: String
    var numExercise: Int
    var progress: Int
    var isLock: Bool
    
}

extension CourseSection {
    static var data: [CourseSection] {
        [
            CourseSection(name: "Fundamental", item: [
                            CourseItem(title: "Abjad", typeName: "Kata Dasar", image: "Abjad",imageDisable: "" ,numExercise: 26, progress: 10, isLock: false),
                            CourseItem(title: "Angka", typeName: "Kata Dasar", image: "Angka",imageDisable: "", numExercise: 20, progress: 2, isLock: false)]),
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
