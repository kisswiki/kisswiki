- https://www.udacity.com/courses/android

## Thomas Künneth - Android UI Development with Jetpack Compose (2022)

Device setup over USB or WLAN https://developer.android.com/studio/debug/dev-options

Emulator https://developer.android.com/studio/run/emulator

Composable emit other composable

remember and mutableStateOf - similar to recoil and atoms?

### "Compose preview" in Adnroid studio to preview without running

Android Studio and Split, `@Preview`, default value or `@PreviewParameter`, `backgroundColor`, `showBackgroroundColor`, `widthDp`, `heightDp`. `locale = "de-rDE"` and `values-de-rDE/strings.xml`, Translations Editor, `showSystemUi`, `device` and `Devices.PIXEL_C`, `group`, `preview > right-click > Copy Image`, `preview > deploy` to real device or emulator and creates new launch configuration

## Michael Fazio - Kotlin and Android Development featuring Jetpack

https://gs.statcounter.com/android-version-market-share/mobile-tablet/worldwide

Choosing Android 10 as base

I didn't have to add `kotlinOptions { jvmTarget = '1.8' }` to `app/build.gradle` as it was already set.

There is also kotlin-dsl https://stackoverflow.com/questions/41113268/how-to-set-up-kotlins-byte-code-version-in-gradle-project-to-java-8/45994990#45994990

To open `AndroidManifest.xml` (`app/src/main/AndroidManifest.xml`) I needed to click xml icon on the side of `MainActivity.kt`.

`MainActivity` has layout with file name backward `activity_main.xml`.

These drawables are svg files:

- `app/src/main/res/drawable-v24/ic_launcher_foreground.xml`
- `app/src/main/res/drawable/ic_launcher_background.xml`

https://developer.android.com/guide/practices/ui_guidelines/icon_design_adaptive

https://developer.android.com/studio/write/translations-editor

Open 'Build' View

> all buildscript {} blocks must appear before any plugins {} blocks in the script
