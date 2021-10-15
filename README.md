![Banner](https://user-images.githubusercontent.com/50937000/137323099-9e1b9df3-abf7-4e32-8c06-be6677a81263.png)

# Signity — Uniting Communication
Signity is an iOS app that helps people learn BISINDO from different regions in Indonesia. Providing visual learning module & real-time practice by machine learning gesture recognition. Currently, Signity is available at the Test Flight app as an iOS app which can be accessed [here](https://testflight.apple.com/join/nKoERm9C) or by scanning the QR Code above.

Signity's Video Ad can be accessed at [this link](https://www.youtube.com/watch?v=Vwn-xaUvPHk).

## Milestones
- [x] <s>Finished design iteration and testing process</s>
- [x] <s>Finished machine learning model training</s>
- [x] <s>Finished iOS app development</s>
- [x] <s>Published app to Test Flight</s>
- [ ] Develop watchOS app
- [ ] Improve machine learning model

## System Requirements
* iOS 14.0 and later

## Main Features
* Visual learning modules (Basic letters, words, and daily conversation)
* Real-time practice with feedbacks
* Real-time conversation simulation

## Technologies
* **Design Pattern**: [MVVM](https://en.wikipedia.org/wiki/Model–view–viewmodel)
* **Language**: [Swift](https://swift.org)
* **UI Builder**: [SwiftUI](https://developer.apple.com/xcode/swiftui/), [UIKit](https://developer.apple.com/documentation/uikit/)
* **Database**: [Core Data](https://developer.apple.com/documentation/coredata)
* **Machine Learning**: [CoreML](https://developer.apple.com/documentation/coreml), [Vision](https://developer.apple.com/documentation/vision), [TensorFlow](http://tensorflow.org)
* **Other**: [Lottie for iOS](https://github.com/airbnb/lottie-ios)

The machine learning model uses Bidirectional Long Short-Term Memory (Bi-LSTM) as the main layer, followed by 2 Dense layers having 128 and 64 nodes, respectively. The model was trained for 50 epochs using the datasets we created ourselves. The detailed training process can be accessed at [Google Colaboratory](https://colab.research.google.com/drive/1EUFq73viET9EQ0Tz5LavVQskTkFIUr__?usp=sharing)

## Our Team
| Name              | Role            | Contact                                                          |
| ------------------|-----------------|------------------------------------------------------------------|
| Aryadinata        | Project Manager | [LinkedIn](https://www.linkedin.com/in/aryadinata/)              |
| Devina Ranlyca    | UI/UX Designer  | [LinkedIn](https://www.linkedin.com/in/devinaranlyca/)           |
| Hanif Fauzi       | UI/UX Designer  | [LinkedIn](https://www.linkedin.com/in/hanif-fauzi/)             |
| Andrean Lay       | Developer       | [LinkedIn](https://www.linkedin.com/in/andrean-lay/)             |
| Charlie Siagian   | Developer       | [LinkedIn](https://www.linkedin.com/in/charlie-siagian-326ba68a/)|

## License
Copyright © 2021 DAHCA Team. Released under the GNU GPLv3 License.

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
