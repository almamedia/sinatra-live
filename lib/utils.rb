require 'colorize'
require 'yaml'

def log_error(msg)
    puts "#{msg}".red
end

def log(msg, sender='')
  unless sender.empty?
    puts sender.green
  end
  puts "#{msg}".light_green
end

def get_livefile_template
  file_path = File.join(File.dirname(File.expand_path(__FILE__)), 'Livefile.template')

  File.open(file_path, 'rb').read
end

def load_livefile
  YAML.load_file('Livefile')
end
