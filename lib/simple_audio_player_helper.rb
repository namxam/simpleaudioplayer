module SimpleAudioPlayerHelper
  class NotImplemented < Exception; end

  def simple_audio_player(dom_id, file, config = {})
    result = content_tag(:p, 'Alternative content', :id => dom_id)
    result += javascript_tag("AudioPlayer.embed('#{dom_id}', { soundFile: '#{file}' });")
  end

  # Load WPAudioPlayer files and init the library
  def simple_audio_player_include_tag(config = {})
    force = config.delete(:force) || false
    config.reverse_merge!(@simple_audio_player_config)
    simple_audio_player_library_tag + "\n" + simple_audio_player_init_tag(config) if @uses_simple_audio_player or force
  end
  
  # Load javascript (uncompressed when in development mode)
  def simple_audio_player_library_tag
    javascript_include_tag development_mode? ? 'simple_audio_player/audio-player.js' : 'simple_audio_player/audio-player-uncompressed.js'
  end
  
  # Load the simple audio player configuration specified in the controller
  def simple_audio_player_init_tag(config = {})
    # TODO: remove invalid config options
    
    # Transform the ruby config hash to a javascript styled config hash
    javascript_tag "AudioPlayer.setup('/flash_files/simple_audio_player/player.swf', #{config.to_json});"
  end
  
private

  # Check if we are in development mode
  def development_mode?
    RAILS_ENV == 'development'
  end

end