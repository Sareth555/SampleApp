require 'dotenv'
require 'aws-sdk'

Dotenv.load

client = Aws::DeviceFarm::Client.new(
  region: ENV['AWS_REGION'],
  credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'],
    ENV['AWS_SECRET_ACCESS_KEY'])
)

project_name = ENV['PROJECT_NAME']
device_pool_name = ENV['DEVICE_POOL_NAME']

# Lookup project_arn by using the project_name variable
projects_list  = client.list_projects
weell_mobile_customer_project = projects_list.projects.select { |p| p.name==project_name }
project_arn = weell_mobile_customer_project.first.arn

# Lookup device_pool_arn by using the device_pool_name variable
list_devicecs_pool = client.list_device_pools(arn: project_arn)
device_pool = list_devicecs_pool.device_pools.select { |d| d.name==device_pool_name }
device_pool_arn= device_pool.first.arn

puts "Client: #{projects_list}"

# resp = client.create_upload({
#   name: "app-release.apk",
#   type: "ANDROID_APP",
#   project_arn: project_arn
# })

# s3_url = resp.upload.url
# uploaded_app_arn = resp.upload.arn

# puts
# puts "Uploading App. Please wait!"
# puts "Project ARN: #{project_arn}"
# puts "Device Pool ARN: #{device_pool_arn}"
# puts "Uploaded App ARN: #{uploaded_app_arn}"

# system("curl -T app-release.apk '#{s3_url}'")

# resp = client.create_upload({
#   name: "bundleSampleApp003.zip",
#   type: "APPIUM_NODE_TEST_PACKAGE",
#   project_arn: project_arn
# })

# s3_url_package = resp.upload.url
# uploaded_test_package_arn = resp.upload.arn

# puts
# puts "Uploading Test Package."
# puts "Uploaded Test Package ARN: #{uploaded_test_package_arn}"
# puts

# system("curl -T bundleSampleApp003.zip '#{s3_url_package}'")

# puts "Scheduling run."
# sleep 4

# resp = client.schedule_run({
#   project_arn: project_arn,
#   app_arn: uploaded_app_arn,
#   device_pool_arn: device_pool_arn,
#   name: "#{project_name}-testrun",
#   test: {
#     type: "APPIUM_NODE",
#     test_package_arn: uploaded_test_package_arn
#   },
#   configuration: {
#     location: {
#       latitude: 11.5449,
#       longitude: 104.8922,
#     },
#     radios: {
#       wifi: true,
#       bluetooth: true,
#       nfc: true,
#       gps: true,
#     }
#   },
# })

# puts
# puts "DONE. Please check AWS Device Farm for results."