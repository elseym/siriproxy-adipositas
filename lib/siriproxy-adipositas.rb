require 'cora'
require 'siri_objects'
require 'pp'

class SiriProxy::Plugin::Adipositas < SiriProxy::Plugin
  def initialize(config)
  end
  
  filter "SetRequestOrigin", direction: :from_iphone do |object|
    puts "[Info - User Location] lat: #{object["properties"]["latitude"]}, long: #{object["properties"]["longitude"]}"
  end

  listen_for /wo bin ich/i do
    say "Your location is: #{location.address}"
  end
  
  listen_for /ist (der|die) (.*) dick/i do |artikel, name|
    say "#{artikel} #{name} ist sehr dick!"
  end
end
