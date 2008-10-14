require 'rubygems'
require 'spec'

require 'java'
unless Object.const_defined?(:BASE_DIR)
  BASE_DIR = File.join(File.dirname(__FILE__),  '/../../') 
  $CLASSPATH << File.join(BASE_DIR, 'target/classes')
  $: << File.join(BASE_DIR, 'src/main/ruby')
  $: << File.join(BASE_DIR, "examples/fixtures")
  Dir[File.join(BASE_DIR, "target/dependency", "*.jar")].each do |jar|
    require jar
  end
end

require 'fit/fit'
