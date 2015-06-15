
name 'smartstack'
maintainer 'Adham Helal'
homepage 'https://github.com/yetu/omnibus-smartstack'

install_dir     '/opt/smartstack'
build_version   Omnibus::BuildVersion.semver
build_iteration 1

# creates required build directories
dependency 'preparation'

dependency 'nerve'
dependency 'synapse'

# version manifest file
dependency 'version-manifest'

exclude '\.git*'
exclude 'bundler\/git'
