# Howto use a string to create rhythm

use_bpm 110

define :to_ring do |a|
  return a.chars.map{|e| e=='x' ? true : false}.ring
end

triad_time = 1.0 / 3.0
drum_co    = to_ring('--x--x-----x')
drum_cc    = to_ring('---x-----x--')
drum_hk    = to_ring('x-----x-----')
drum_sh    = to_ring('------x-----')

live_loop :beat do; sleep 1; end
live_loop :beat_4, sync: :beat do; sleep 4; end

live_loop :triad, sync: :beat_4 do tick
  
  sample :drum_cymbal_soft if drum_co.look
  sample :drum_cymbal_closed if drum_cc.look
  sample :drum_bass_soft if drum_hk.look
  sample :drum_snare_hard if drum_sh.look
  
  sleep triad_time
end
