name "synapse"
relative_path "synapse"

source :git => "https://github.com/getyourguide/synapse.git"
default_version "production"

dependency "ruby"
dependency "rubygems"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  #bundle "install --without guard", env: env
  #bundle "exec rake build", env: env

  gem "build synapse.gemspec"
  gem "install synapse-*.gem --no-ri --no-rdoc --bindir '#{install_dir}/bin'", env: env
end
