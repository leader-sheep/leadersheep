##| Tick and Look

rhythm = (ring 0.5, 0.5, 0.5, 0.25, 0.25)
chords_36 = (ring
             (chord :b3, '6*9').shuffle,
             (chord :e3, '6*9').shuffle,
             (chord :a3, '6*9').shuffle,
             (chord :e3, '6*9').shuffle
             )
chords_36_idx = 0
current_chord = chords_36[chords_36_idx]
chords_36_idx = chords_36_idx + 1
live_loop :test, sync: :drum, delay: 5 do tick
  if look % 20 == 0 then
    current_chord = chords_36[chords_36_idx]
    chords_36_idx = chords_36_idx + 1
  end
  
  with_fx :slicer, phase: bt(0.125) do
    with_fx :reverb, room: 0.5 do
      
      synth :blade,
        note: current_chord.look,
        cutoff: 75,
        release: 1.5
    end
  end
  
  sleep rhythm.look
end

hit_it = (spread 7, 8)
live_loop :drum, sync: :go do tick
  puts look
  
  if hit_it.look then
    sample :loop_breakbeat, onset: 3, rate: 0.5, amp: 2
  end
  
  sleep 0.5
end

# Init the sound
sleep 0.2
cue :go