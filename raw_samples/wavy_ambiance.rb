# Ambiance 1

live_loop :wavy do
  with_fx :reverb, room: 0.8 do
    with_fx:echo,
      phase: 0.8,
      mix: 1,
    decay: 4 do
      use_synth :tb303
      n = (scale :c4, :major_pentatonic).choose
      play chord(n, '5'), cutoff: 70
      sleep 1 * (1 + rand_i(3))
    end
  end
end