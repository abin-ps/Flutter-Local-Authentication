# Biometric Authentication in Flutter


## Dependencies

```yaml
    local_auth: ^2.2.0
```

## Configurations:

### Android Specific Configurations
 - Update permissions to `AndroidManifest.xml` file
    ```xml
        <uses-permission android:name="android.permission.USE_BIOMETRIC"/>
    ```
 - Update `MainActivity.kt` file. 
    ```kt
        import io.flutter.embedding.android.FlutterActivity //remove this line
        import io.flutter.embedding.android.FlutterFragmentActivity //add this line

        class MainActivity: FlutterActivity() //remove this line
        class MainActivity: FlutterFragmentActivity() //add this line
    ```

    output will be,
    ```kt 
        package com.example.flutter_local_authentication

        import io.flutter.embedding.android.FlutterFragmentActivity

        class MainActivity: FlutterFragmentActivity()

    ```

### iOS Specific Configurations
 - Update Permission to `info.plist` file
    ```plist
        <key>NSFaceIDUsageDescription</key>
        <string>Why is my app authenticating using face id?</string>
    ```

## Reference:
[Flutter Local Authentication Tutorial - Flutter Face ID & Fingerprint Authentication Guide](https://www.youtube.com/watch?v=cYeQCGr6F7c)