## For web

- https://www.smashingmagazine.com/2016/08/a-glimpse-into-the-future-with-react-native-for-web/
- https://github.com/necolas/react-native-web
- https://github.com/este/este

##

React Native is very popular (and deserves to be), but because the JavaScript realm accesses the OEM widgets in the native realm, it has to go through the bridge for those as well. Widgets are typically accessed quite frequently (up to 60 times a second during animations, transitions, or when the user “swipes” something on the screen with their finger) so this can cause performance problems. As one article about React Native puts it:

Here lies one of the main keys to understanding React Native performance. Each realm by itself is blazingly fast. The performance bottleneck often occurs when we move from one realm to the other. In order to architect performant React Native apps, we must keep passes over the bridge to a minimum.

https://hackernoon.com/whats-revolutionary-about-flutter-946915b09514