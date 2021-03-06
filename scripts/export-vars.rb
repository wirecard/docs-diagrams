# frozen_string_literal: true

require 'asciidoctor'
require 'optparse'
require 'humanize'
require 'net/http'
require 'uri'

URL = 'https://raw.githubusercontent.com/wirecard/docs/master/content/shortcuts.adoc'

def check_key(key)
  skey = key.to_s
  return  %w[doc user].any? { |w| skey.start_with?(w) } || %w[caption refsig].any? { |w| skey.end_with?(w) }
end

def check_value(val)
  return true if val.nil?

  sval = val.to_s
  return sval.empty?
end

def replace_num(val)
  val.to_s.scan(/\d+/).each do |num|
    val = val.sub(num, num.to_i.humanize.capitalize)
  end
  return val.delete(' ')
end

def main
  options = {url: URL}
  OptionParser.new do |opts|
    opts.banner = 'Usage: ruby export-vars.rb FILE'

    opts.on('-v', '--verbose', 'Run verbosely') do |v|
      options[:verbose] = v
    end

    opts.on('-u', '--url URL', "URL to adoc file (default: #{URL})") do |url|
      puts "Setting custom url: #{url}"
      options[:url] = url
    end
  end.parse!

  url = URI(options[:url])

  file = File.basename(url.path)
  puts "Downloading #{url}"
  Net::HTTP.start(url.host, use_ssl: true) do |http|
    http.request_get(url.path) do |resp|
      File.open(file, 'wb') do |f|
        f.write(resp.body)
      end
    end
  end

  puts "Reading #{file}"
  # doc = Asciidoctor.load_file(file, safe: :unsafe, parse: false)
  doc = Asciidoctor.load_file(file, safe: :unsafe, header_only: true)
  attrs = doc.attributes

  if options[:verbose]
    attrs.each do |k,v|
      puts "#{k}\t->\t#{v}"
    end
  end

  content = attrs.reject { |k, v| check_key(k) || check_value(v) }.map do |k, v|
    k_valid = replace_num(k.to_s).delete('-')
    v_valid = v.to_s.sub('#', '\\#')
    "\\newcommand\\wd#{k_valid}{#{v_valid}}"
  end.join("\n")

  tex_file = File.basename(file, '*.adoc') + '.tex'
  puts "Writing #{tex_file}"
  File.open(tex_file, 'w+') do |f|
    f.write(content)
  end
end

main
