# Howto use a string to create rhythm

define :to_ring do |a|
  return a.chars.map{|e| e=='x' ? true : false}.ring
end

rhythm      = to_ring('xxx-xx-x-xx-')
rhythm_bell = to_ring('x-----------')

live_loop :cleap do tick
  
  if rhythm.look
    sample :drum_heavy_kick
  end
  
  if rhythm_bell.look
    synth :pretty_bell, note: :e3, release: 0.5
  end
  
  sleep 0.125
end


