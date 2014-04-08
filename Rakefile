require "bundler/gem_tasks"

desc "Run specs"
task "test" do
  ruby "-I'lib:spec' " + FileList['spec/**/*_spec.rb'].join(' ')
end
