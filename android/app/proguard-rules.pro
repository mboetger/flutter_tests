# Keep Flutter video player and Pigeon generated classes
-keep class dev.flutter.pigeon.video_player_android.** { *; }
-keep class io.flutter.plugins.videoplayer.** { *; }

# Keep ExoPlayer classes which the plugin uses internally
-keep class com.google.android.exoplayer2.** { *; }
-keep class androidx.media3.** { *; }
