# Playing with control

##
# A simple example with sound effects control
##
live_loop :drum do
  with_fx :reverb, room: 0.3 do
    with_fx :ring_mod, freq: 30, mix: 1, freq_slide: 1.5 do |r|
      sample :loop_amen, beat_stretch: 2, cutoff: 80
      control r, freq: 90
    end
  end
  sleep 2
end