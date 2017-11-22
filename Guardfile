# RUBYOPT="-W0" is used to silence warnings
# Reference: https://stackoverflow.com/questions/5591509/suppress-ruby-warnings-when-running-specs

ignore([%r{^(bin|config|db|lib|log|public|tmp)/*}])

guard :rspec, cmd: 'RUBYOPT="-W0" bundle exec rspec' do
  require "guard/rspec/dsl"
  dsl = Guard::RSpec::Dsl.new(self)

  # RSpec files
  rspec = dsl.rspec
  watch(rspec.spec_helper) { rspec.spec_dir }
  watch(rspec.spec_support) { rspec.spec_dir }
  watch(rspec.spec_files)

  # Ruby files
  ruby = dsl.ruby
  dsl.watch_spec_files_for(ruby.lib_files)

  # Rails files
  rails = dsl.rails(view_extensions: %w(erb haml slim))
  dsl.watch_spec_files_for(rails.app_files)

  watch(rails.spec_helper)     { rspec.spec_dir }
  watch(%r{^app/controllers/(.+)_(controller)\.rb}) { |m| "spec/requests/#{m[1]}_spec.rb" }
  watch(rails.app_controller)  { "#{rspec.spec_dir}/requests" }
  watch(rails.routes)          { "#{rspec.spec_dir}/requests" }
  watch(rails.app_controller)  { "#{rspec.spec_dir}/requests" }
end
