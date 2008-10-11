require 'rubygems'
require 'spec'

require 'java'
BASE_DIR = File.join(File.dirname(__FILE__),  '/../../')
$CLASSPATH << File.join(BASE_DIR, 'target/classes')
$:.unshift File.join(BASE_DIR, 'src/main/ruby')
