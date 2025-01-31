Pod::Spec.new do |s|
  s.name         = "iOSSnapshotTestCase"
  s.module_name  = "iOSSnapshotTestCase"
  s.version      = "6.1.0"
  s.summary      = "Snapshot view unit tests for iOS"
  s.description  = <<-DESC
                    A "snapshot test case" takes a configured UIView or CALayer
                    and uses the renderInContext: method to get an image snapshot
                    of its contents. It compares this snapshot to a "reference image"
                    stored in your source code repository and fails the test if the
                    two images don't match.
                   DESC
  s.homepage     = "https://github.com/uber/ios-snapshot-test-case"
  s.license      = 'MIT'
  s.author       = 'Uber'
  s.source       = { :git => "https://github.com/uber/ios-snapshot-test-case.git",
                     :tag => s.version.to_s }
  s.ios.deployment_target  = '10.0'
  s.tvos.deployment_target = '10.0'
  s.swift_version = '5.0.1'
  s.requires_arc = true
  s.frameworks   = 'XCTest','UIKit','Foundation','QuartzCore'
  s.pod_target_xcconfig = { 'ENABLE_BITCODE' => 'NO' }
  s.user_target_xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '$(PLATFORM_DIR)/Developer/Library/Frameworks' }
  s.default_subspecs = 'SwiftSupport'
  s.subspec 'Core' do |cs|
    cs.source_files = 'iOSSnapshotTestCase/**/*.{h,m}', 'iOSSnapshotTestCase/*.{h,m}'
    cs.public_header_files = 'iOSSnapshotTestCase/FBSnapshotTestCase.h','iOSSnapshotTestCase/FBSnapshotTestCasePlatform.h','iOSSnapshotTestCase/FBSnapshotTestController.h'
    cs.private_header_files = 'iOSSnapshotTestCase/Categories/UIImage+Compare.h','iOSSnapshotTestCase/Categories/UIImage+Diff.h','iOSSnapshotTestCase/Categories/UIImage+Snapshot.h'
  end
  s.subspec 'SwiftSupport' do |cs|
    cs.dependency 'iOSSnapshotTestCase/Core'
    cs.source_files = 'iOSSnapshotTestCase/**/*.swift'
  end
end
