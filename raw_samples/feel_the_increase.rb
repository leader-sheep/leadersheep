# Feel the increase

# Having with cutoff

# TODO: I need to find a strong bass beat
# to explore the potential of lunching a crowd

melo    = (ring
           :e4, :r, :gb4, :g4,
           :e4, :a4, :gb4, :eb4, :e4)
rel     = (ring
           1, 0.5, 0.5, 0.25,
           1, 0.5, 0.5, 0.1, 0.4)
rhythm  = (ring
           0.5, 0.5, 0.25, 0.25,
           1, 0.5, 0.5, 0.1, 0.4)

live_loop :beat do
  sleep 1
end

melo_loop = 0
live_loop :melo1, sync: :beat do tick
  use_synth :tb303
  
  if look % melo.length == 0 then
    melo_loop += 1
  end
  duration = rhythm.look
  
  time_warp rrand(-0.02, 0.02) do
    with_fx :rlpf, cutoff: 72, cutoff_slide: duration, res: 0.8 do |r|
      play melo.look, release: rel.look
      control r, cutoff: 22 + 10 * (melo_loop % 6)
    end
  end
  sleep duration / 2.0
end
