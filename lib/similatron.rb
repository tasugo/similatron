require "English"
require 'securerandom'
require 'open3'
require 'json'
require 'erb'
require 'fileutils'
require 'tmpdir'

require "similatron/version"
require "similatron/comparison"
require "similatron/comparison_engine"
require "similatron/imagemagick_comparison_engine"
require "similatron/pdf_comparison_engine"
require "similatron/diff_comparison_engine"
require "similatron/binary_diff_comparison_engine"
require "similatron/run"
require "similatron/html_report"

module Similatron
  def self.compare(*args)
    run.compare!(*args)
  end

  def self.complete
    run.complete
    puts run.summary
  end

  def self.run
    @run ||= begin
               run = Run.new
               run.start
               run
             end
  end

  def self.lib_path
    File.dirname(__FILE__)
  end
end
