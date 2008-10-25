require 'rubygems'
require 'spec/rake/spectask'

desc "Clean and Compiles Java code"
task :clean_compile do
  sh "mvn clean test-compile"
end

desc "Runs all examples"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList["src/spec/**/*_spec.rb"]
end

task :default => [:clean_compile, :spec]
