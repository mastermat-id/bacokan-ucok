# Keep Flutter and plugin metadata stable while allowing R8 to shrink code.
-keep class io.flutter.app.** { *; }
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.plugins.** { *; }

# Preserve line information so Play Console crash traces remain useful.
-keepattributes SourceFile,LineNumberTable
