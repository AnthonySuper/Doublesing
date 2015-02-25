require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :specification do
  5.times{`pdflatex ./tex/spec.tex`}
  `rm ./spec.log`
  `rm ./spec.aux`
end
