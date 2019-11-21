# Tick and Look

coff = (ring 70, 70, 130, 130, 130, 90, 90, 70)
e36 = (chord :e3, '6').shuffle
a = (spread 9, 16)
live_loop :test, sync: :drum do
  tick
  puts a.look
  with_fx :slicer, phase: 0.125, wave: a.look do
    synth :blade, note: e36.look, cutoff: coff.look
  end
  sleep 0.5
end

live_loop :drum do
  sample :loop_breakbeat, onset: 3
  sleep 0.5
end