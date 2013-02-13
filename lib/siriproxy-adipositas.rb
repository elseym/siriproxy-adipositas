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
  
  listen_for /Ist (der|die) (.*) dick/i do |artikel, name|
    set_state :widrig
    artikel[0] = artikel[0, 1].upcase
    say "#{artikel} #{name} ist sehr dick!"
  end
  
  listen_for /wie dick/i, within state :widrig do
    say "MEGA DICK!"
    set_state nil
  end
  
end
