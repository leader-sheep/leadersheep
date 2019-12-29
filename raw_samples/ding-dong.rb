live_loop :beat do; sleep 1; end
live_loop :beat4, sync: :beat do; sleep 4; end
live_loop :beat8, sync: :beat do; sleep 8; end


live_loop :chords, sync: :beat do
  dt = 1
  use_synth :beep
  chords = [chord(:a3, :m),
            chord(:f3, :M),
            chord(:c3, :M),
            chord(:d3, :m7)]
  tick_reset
  
  4.times do tick
    c = chords.look
    play c,
      sustain: dt,
      release: 0
    sleep dt
  end
end

live_loop :melo, sync: :beat4, delay: 16 do tick
  a_scale = scale(:a4, :minor_pentatonic, num_octaves: 2)
  if look % 6 < 2 then
    use_random_seed 100
  else
    use_random_seed 1
  end
  
  
  ##| if (spread 1, 2).look then
  ##|   use_synth :dsaw
  ##| else
  ##|   use_synth :fm
  ##| end
  
  16.times do
    
    with_fx :echo, decay: 2, phase: 0.25 do
      p = play a_scale.choose,
        amp: 0.2,
        release: 0.5,
        attack: 0
      control p, cutoff: 50, cutoff_slide: 0.125
      sleep 0.125
    end
    
  end
end

live_loop :bass, sync: :beat4, delay: 4 do
  use_synth :beep
  dt = 0.5
  notes = [:a1, :a1 + 5,
           :f1, :f1 + 5,
           :c1, :c1 + 5,
           :d1, :d1 + 5 ]
  tick_reset
  4.times do tick
    n = notes.look
    play n, sustain: dt, release: 0
    sleep dt
  end
end

live_loop :drum, sync: :beat4, delay: 8 do tick
  use_random_seed 1
  tick_reset
  
  16.times do
    sample :drum_bass_soft if one_in(8)
    sample :drum_cymbal_closed if one_in(2)
    sample :drum_heavy_kick if one_in(4)
    sample :drum_tom_lo_soft if one_in(3)
    sample :drum_tom_mid_soft if one_in(3)
    sample :drum_tom_hi_soft if one_in(3)
    sleep 0.125
  end
end
