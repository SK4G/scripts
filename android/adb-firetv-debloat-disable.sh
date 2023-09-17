#!/bin/bash

adb shell pm disable-user --user 0 com.amazon.tahoe
adb shell pm disable-user --user 0 com.amazon.shoptv.firetv.client
adb shell pm disable-user --user 0 com.amazon.client.metrics
adb shell pm disable-user --user 0 com.amazon.bueller.music
adb shell pm disable-user --user 0 com.amazon.bueller.photos
adb shell pm disable-user --user 0 com.amazon.device.metrics
adb shell pm disable-user --user 0 com.amazon.imdb.tv.android.app
adb shell pm disable-user --user 0 com.amazon.ags.app
adb shell pm disable-user --user 0 com.amazon.hedwig
adb shell pm disable-user --user 0 com.amazon.shoptv.firetv.client
adb shell pm disable-user --user 0 com.amazon.cloud9
