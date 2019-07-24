require 'bundler'
require 'open-uri'
require 'json'
require 'csv'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'scrapper' #plus besoin de préciser le path exact

mairies = Scrapper.new
mairies.perform
