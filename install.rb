# TODO: create installation procedure

require 'fileutils'

PLUGIN_DIR = File.dirname(__FILE__)

puts 'Starting plugin installation'

# Create the simple_audio_player directories
FileUtils.mkdir_p RAILS_ROOT + '/public/javascripts/simple_audio_player'
FileUtils.mkdir_p RAILS_ROOT + '/public/flash_files/simple_audio_player'

# Install the flash player and javascripts
FileUtils.cp PLUGIN_DIR + '/audio-player/player.swf', RAILS_ROOT + '/public/flash_files/simple_audio_player/player.swf'
FileUtils.cp PLUGIN_DIR + '/audio-player/audio-player.js', RAILS_ROOT + '/public/javascript/simple_audio_player/audio-player.js'
FileUtils.cp PLUGIN_DIR + '/audio-player/audio-player-uncompressed.js', RAILS_ROOT + '/public/javascript/simple_audio_player/audio-player-uncompressed.js'

puts 'Installation completed'
