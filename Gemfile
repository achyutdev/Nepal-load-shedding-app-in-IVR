source 'https://rubygems.org'

gem 'adhearsion', '~> 2.6'

# Exercise care when updating the Punchblock major version, since Adhearsion
# apps sometimes make use of underlying features from the Punchblock API.
# Occasionally an update of Adhearsion will necessitate an update to
# Punchblock; in those cases update this line and test your app thoroughly.
gem 'punchblock', '~> 2.6'

# This is here by default due to deprecation of #ask and #menu.
# See http://adhearsion.com/docs/common_problems#toc_3 for details
gem 'adhearsion-asr'

#google tts
gem 'google_tts_plugin', git: "https://github.com/github0013/google_tts_plugin.git"

#asterisk-adhearsion is a adhearsion plugin which help to run asterisk comment in adhearsion
gem 'adhearsion-asterisk'

#
# Check http://ahnhub.com for a list of plugins you can use in your app.
# To use them, simply add them here and run `bundle install`.
#

group :development, :test do
  gem 'rspec'
end
