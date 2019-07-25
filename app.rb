require 'bundler'
Bundler.require
$:.unshift File.expand_path("./../lib", __FILE__)

require 'app/boardcase'
require 'app/player'
require 'app/board'
require 'app/game'
require 'app/application'
require 'views/show'

def perform
  Application.new.perform
end

perform
