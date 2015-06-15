name "nerve"
default_version "1.0.0"
relative_path "nerve"

source :git => "https://github.com/ahelal/nerve.git"
version "production"

dependency "ruby"
dependency "rubygems"
always_build true

build do
  env = with_standard_compiler_flags(with_embedded_path)
  #bundle "install --without guard", env: env
  #bundle "exec rake build", env: env

  gem "build nerve.gemspec"
  gem "install nerve-*.gem --no-ri --no-rdoc --bindir '#{install_dir}/bin'", env: env
end
