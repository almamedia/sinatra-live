require_relative "utils"
require 'colorize'
require 'clamp'
require 'filewatcher'
require 'net/http'

class InitCommand < Clamp::Command

  def execute
    # check for existing Livefile
    unless File.exists?('Livefile')
      # load template
      template = get_livefile_template

      # save the template to a Livefile
      File.open('Livefile', 'w') { |file|
        file.write(template)
      }

      log "Livefile created"
    else
      log_error 'Livefile already exists!'
    end
  end

end

class WatchCommand < Clamp::Command

  def execute
    # read Livefile
    livefile = load_livefile
    # start watching folders
    log "Watching folders for changes"
    livefile['folders'].each do |folder|
      log "\t#{folder}"
    end
    puts

    FileWatcher.new(livefile['folders']).watch do |filename|
      log "Updated " + filename
      # call control url to reload on changes
      puma_control_url = livefile['puma']['control'] + "/restart?token=" + livefile['puma']['token']

      result = Net::HTTP.get(URI.parse(puma_control_url))
      log "\tserver restart"
    end

  end

end

class SinatraLiveCommand < Clamp::Command

  puts "\nSinatra (live)\n".light_blue

	self.default_subcommand = 'watch'

  subcommand 'watch', 'Start watching for changes (default)', WatchCommand
	subcommand 'init', 'Create default Livefile.', InitCommand

end

SinatraLiveCommand.run
