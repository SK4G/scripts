#!/bin/bash

adb shell su
 
pm uninstall -k --user 0 com.amazon.tahoe
pm uninstall -k --user 0 com.amazon.shoptv.firetv.client
pm uninstall -k --user 0 com.amazon.client.metrics
pm uninstall -k --user 0 com.amazon.bueller.music
pm uninstall -k --user 0 com.amazon.bueller.photos
pm uninstall -k --user 0 com.amazon.device.metrics
pm uninstall -k --user 0 com.amazon.imdb.tv.android.app
pm uninstall -k --user 0 com.amazon.ags.app
pm uninstall -k --user 0 com.amazon.hedwig
pm uninstall -k --user 0 com.amazon.shoptv.firetv.client
pm uninstall -k --user 0 com.amazon.cloud9
pm uninstall -k --user 0 com.amazon.device.software.ota
pm uninstall -k --user 0 com.amazon.device.software.ota.override
pm uninstall -k --user 0 com.amazon.dcp
pm uninstall -k --user 0 com.amazon.dcp.contracts.framework.library
pm uninstall -k --user 0 com.amazon.dcp.contracts.library
pm uninstall -k --user 0 com.amazon.device.software.ota
pm uninstall -k --user 0 com.amazon.device.software.ota.override
pm uninstall -k --user 0 com.amazon.settings.systemupdates
pm uninstall -k --user 0 com.amazon.device.software.ota.handler.OtaTaskHandler
pm uninstall -k --user 0 com.amazon.device.logmanager
pm uninstall -k --user 0 com.amazon.franktvinput
pm uninstall -k --user 0 com.amazon.alexashopping

pm clear com.amazon.tahoe
pm clear com.amazon.shoptv.firetv.client
pm clear com.amazon.client.metrics
pm clear com.amazon.bueller.music
pm clear com.amazon.bueller.photos
pm clear com.amazon.device.metrics
pm clear com.amazon.imdb.tv.android.app
pm clear com.amazon.ags.app
pm clear com.amazon.hedwig
pm clear com.amazon.shoptv.firetv.client
pm clear com.amazon.cloud9
pm clear com.amazon.device.software.ota
pm clear com.amazon.device.software.ota.override
pm clear com.amazon.dcp
pm clear com.amazon.dcp.contracts.framework.library
pm clear com.amazon.dcp.contracts.library
pm clear com.amazon.device.software.ota
pm clear com.amazon.device.software.ota.override
pm clear com.amazon.settings.systemupdates
pm clear com.amazon.device.software.ota.handler.OtaTaskHandler
pm clear com.amazon.device.logmanager
pm clear com.amazon.franktvinput
pm clear com.amazon.alexashopping