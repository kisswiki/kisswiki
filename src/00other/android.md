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

## https://developer.android.com/jetpack/compose/tutorial

I am starting this instead of "Michael Fazio - Kotlin and Android Development featuring Jetpack", beacuse this one uses Empty Compose Activity.

I have read also prerequisites:

- https://developer.android.com/topic/libraries/architecture/viewmodel
- https://developer.android.com/jetpack/compose/setup

When there is preview for composable, in split or design view at the top, there is refresh icon: "Build Refresh" alt+cmd+shift+r

After using `Column`, I needed to import it with `alt+enter` with cursor over `Column`.

I needed to import `Image` by hand `import androidx.compose.foundation.Image`.

`Image` does not use curly braces. Use `Image()`. Also first import is `import android.media.Image` which is wrong.

Android Studio hanged on "Import Drawables" when I clicked "Downloads" in Finder. In Activity Monitor, Android Studio has adnotation "Not responding".

Drag-and-drop from Finder worked. Also MacOS asked if I want to give Android Studio permission to view Downloads folder.

Image showed in Resource Manager after I run "Build Refresh".

When using Image like in tutorial

```kotlin
        Image(
            painter = painterResource(R.drawable.profile_picture),
            contetDescription = "Contact profile picture",
        )
```

I got error: "None of the following functions can be called with the arguments supplied."

This worked:

```kotlin
        Image(
            painterResource(R.drawable.profile_picture),
            "Contact profile picture",
        )
```

or without typo:

```kotlin
        Image(
            painter = painterResource(R.drawable.profile_picture),
            contentDescription = "Contact profile picture",
        )
```

I couldn't import `.clip` with alt+enter, but hovering mouse and chosing import worked.

Note: the Empty Compose Activity template generates a default theme for your project that allows you to customize MaterialTheme. If you named your project anything different from ComposeTutorial, you can find your custom theme in the Theme.kt file in the ui.theme subpackage.

To fix indent in Text argument, I needed to use Reformat Code alt+cmd+l

cmd+shift+f12 to hide unneeded sidebars in Android Studio.

UNSOLVED: `uiMode = Configuration.UI_MODE_NIGHT_YES` does not show dark background. Clicking in Android studio on uiMode doc gives us 404 https://developer.android.com/reference/android/android/content/res/Configuration.html#uiMode.

https://stackoverflow.com/questions/72806571/android-jetpack-compose-preview-ui-mode-night-yes-does-not-show-dark-background

I got error when trying "Run Preview": `INSTALL_FAILED_INSUFFICIENT_STORAGE`

Solution was to close emulator with x, go to Device Manager and from dropdown select "Wipe Data" and "Run Preview" again.

https://stackoverflow.com/questions/39430470/android-studio-install-failed-insufficient-storage/58210876#58210876

`@Preview(name = "Full Preview", showSystemUi = true)` https://alexzh.com/jetpack-compose-preview/

I needed to add import by hand `import androidx.compose.foundation.lazy.items`

To import dataset

To import it right click in Project tab, Android selected in dropdown.

Right-click on `app > java > dev.yourname.composetutorial` then `New > Kotlin Class/File` and just paste content from this gist.

https://gist.github.com/yrezgui/26a1060d67bf0ec2a73fa12695166436?permalink_comment_id=4216621#gistcomment-4216621
