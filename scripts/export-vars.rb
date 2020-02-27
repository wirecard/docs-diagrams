# frozen_string_literal: true

require 'asciidoctor'
require 'optparse'

def check_value(val)
  return val.nil? || val.to_s.empty?
end

OptionParser.new do |opts|
  opts.banner = 'Usage: ruby export-vars.rb FILE'
end.parse!

unless (file = ARGV.shift)
  puts "Gimme a filename, c'mon dude"
end

# doc = Asciidoctor.load_file(file, safe: :unsafe, parse: false)
doc = Asciidoctor.load_file(file, safe: :unsafe, header_only: true)
attrs = doc.attributes

content = attrs.reject { |_, v| check_value(v) }.map do |k, v|
  "\\newcommand\\wd#{k.delete('-')}{#{v}}"
end.join("\n")

tex_file = File.basename(file, '*.adoc') + '.tex'
File.open(tex_file, 'w+') do |f|
  f.write(content)
end
