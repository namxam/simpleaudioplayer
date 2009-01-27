# SimpleAudioPlayer
module SimpleAudioPlayer

  # Extend the controller and add the custom helper
  def self.included(base)
    base.extend(ClassMethods)
    base.helper SimpleAudioPlayerHelper
  end

  # Provides methods which should be available to the controller
  module ClassMethods
    
    def uses_simple_audio_player(options = {})
      # Extract the audio player config from the default before_filter options
      config = options.delete(:config) || {}
      
      # Init the simple audio player
      init_simple_audio_player = Proc.new do |i|
        i.instance_variable_set(:@simple_audio_player_config, config)
        i.instance_variable_set(:@uses_simple_audio_player, true)
      end
      
      before_filter(init_simple_audio_player, options)
    end
    
  end
  
end