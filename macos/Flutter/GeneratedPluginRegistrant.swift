//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import geolocator_apple
import path_provider_macos
import sqflite
import url_launcher_macos
import window_utils

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  GeolocatorPlugin.register(with: registry.registrar(forPlugin: "GeolocatorPlugin"))
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
  SqflitePlugin.register(with: registry.registrar(forPlugin: "SqflitePlugin"))
  UrlLauncherPlugin.register(with: registry.registrar(forPlugin: "UrlLauncherPlugin"))
  WindowUtils.register(with: registry.registrar(forPlugin: "WindowUtils"))
}
