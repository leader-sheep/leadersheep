# Drum and bass

# TODO: Need a nice drum sample

live_loop :bass do
  sample :tabla_ghe6, rate: 0.5
  sleep bt(2)
  sample :tabla_ghe6, rate: 0.6
  sleep bt(2)
end

live_loop :hit, sync: :bass, delay: 2 do
  sleep bt(1)
  with_fx :whammy, transpose: 4, grainsize: 1 do
    sample :tabla_ghe2, attack: 0.1, sustain: 0,  release: 0.1
  end
  sleep bt(2)
  with_fx :whammy, transpose: 0, grainsize: 0.3 do
    sample :tabla_ghe2,  attack: 0.1, sustain: 0,  release: 0.1
  end
  sleep bt(1)
end


