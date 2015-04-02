# encoding: utf-8

Adhearsion.config do |config|

  # Centralized way to specify any Adhearsion platform or plugin configuration
  # - Execute rake config:show to view the active configuration values
  #
  # To update a plugin configuration you can write either:
  #
  #    * Option 1
  #        Adhearsion.config.<plugin-name> do |config|
  #          config.<key> = <value>
  #        end
  #
  #    * Option 2
  #        Adhearsion.config do |config|
  #          config.<plugin-name>.<key> = <value>
  #        end

  ##using google tts 

    config.google_tts_plugin do |config|
      config.save_to      = "/home/#{ENV['USER']}/connect/audio" # make sure you have permissions write
      config.language     = "es"
      config.speed        = "100%"
      config.volume       = "130%"
      #config.google_tts  = "change here if google changes tts uri"
      config.mpg123_path  = "/usr/bin/mpg123" # change it to your path or nil if not installed (but required on centos)
      config.sox_path     = "/usr/bin/sox"       # change it to your path
    end




  config.development do |dev|
    dev.platform.logging.level = :warn
  end

  ##
  # Use with Rayo (eg Voxeo PRISM or FreeSWITCH mod_rayo)
  #
  # config.punchblock.username = "usera@freeswitch.local-dev.mojolingo.com" # Your XMPP JID for use with Rayo
  # config.punchblock.password = "1" # Your XMPP password

  ##
  # Use with Asterisk
  #
  config.punchblock.platform = :asterisk # Use Asterisk
  config.punchblock.username = "myuser" # Your AMI username
  config.punchblock.password = "dev" # Your AMI password
  config.punchblock.host = "localhost" # Your AMI host
end
