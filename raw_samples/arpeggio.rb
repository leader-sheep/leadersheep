# Melody 1

use_bpm 122

live_loop :beat do
  sleep 1
end

live_loop :bip, sync: :beat do tick
  nb_beats = 32
  puts look % nb_beats
  if look == 0 or look % nb_beats != 0 then
    synth :tb303, note: :d2, attack: 0.005, release: 0
    sleep 1
  else
    with_fx :reverb, room: 1, mix: 0.8 do
      play :d2, attack: 0.005, release: 0, amp: 2
    end
    sleep nb_beats / 2
  end
  
end

live_loop :melody, sync: :bip do tick
  s = (ring (chord :d3, '5'), :r, :a3, :r, :c4, :e3, :r)
  s7 = s + 7 # the fifth
  s12 = s - 12 # The lower octave
  
  with_fx :reverb, room: 0.2, mix: 0.2 do
    play s.look, release: 0.5
    time_warp 0.301 do # log(2)
      play s7.look, release: 0.5
    end
    time_warp 0.477 do # log(3)
      play s12.look, release: 0.5
    end
    sleep 1
  end
end # with_fx reverb
