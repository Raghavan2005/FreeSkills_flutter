#
# Generated file, do not edit.
#

Pod::Spec.new do |s|
  s.name             = 'FlutterPluginRegistrant'
  s.version          = '0.0.1'
  s.summary          = 'Registers plugins with your Flutter app'
  s.description      = <<-DESC
Depends on all your plugins, and provides a function to register them.
                       DESC
  s.homepage         = 'https://flutter.dev'
  s.license          = { :type => 'BSD' }
  s.author           = { 'Flutter Dev Team' => 'flutter-dev@googlegroups.com' }
  s.ios.deployment_target = '12.0'
  s.source_files =  "Classes", "Classes/**/*.{h,m}"
  s.source           = { :path => '.' }
  s.public_header_files = './Classes/**/*.h'
  s.static_framework    = true
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.dependency 'Flutter'
  s.dependency 'app_links'
  s.dependency 'awesome_notifications'
  s.dependency 'cloud_firestore'
  s.dependency 'connectivity_plus'
  s.dependency 'device_info_plus'
  s.dependency 'firebase_auth'
  s.dependency 'firebase_core'
  s.dependency 'flutter_inappwebview_ios'
  s.dependency 'flutter_native_splash'
  s.dependency 'flutter_pdfview'
  s.dependency 'google_mobile_ads'
  s.dependency 'google_sign_in_ios'
  s.dependency 'image_picker_ios'
  s.dependency 'package_info_plus'
  s.dependency 'path_provider_foundation'
  s.dependency 'share_plus'
  s.dependency 'shared_preferences_foundation'
  s.dependency 'sqflite_darwin'
  s.dependency 'url_launcher_ios'
  s.dependency 'webview_flutter_wkwebview'
  s.dependency 'workmanager'
end
