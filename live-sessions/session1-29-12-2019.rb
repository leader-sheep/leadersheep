live_loop :beat do; sleep 1; end
live_loop :beat4, sync: :beat do; sleep 4; end
live_loop :beat8, sync: :beat do; sleep 8; end
live_loop :beat16, sync: :beat do; sleep 16 end


# 1st experiment
with_fx :sound_out_stereo, output: 5 do
  live_loop :keys, sync: :beat4 do tick
    stop
    
    use_synth :prophet
    
    main_chords = (ring
                   (chord :Ab, :major7),
                   (chord :Db, :major7),
                   (chord :Bb, :minor7),
                   (chord :Eb, "7")
                   )
    play main_chords.look, attack: 0.4, release: 1
    sleep 1
  end
  
  live_loop :lead, sync: :beat4 do
    stop
    
    with_fx :level, amp: 0 do
      use_synth :fm
      use_random_seed 1100
      tick_reset
      
      ab_scale = scale(:ab3, :minor, use_octave: 2)
      16.times do tick
        if one_in 6 then
          play :r
        else
          play ab_scale.choose
          sleep 0.25
        end
      end
    end
  end
  
  live_loop :bass, sync: :beat4 do tick
    stop
    
    bass_notes = (ring :Ab2, :Bb2)
    synth :dsaw, detune: 7,
      note: bass_notes.look,
      amp: 0,
      attack: 0, sustain: 2, release: 0.2
    sleep 2
  end
  
  
  live_loop :drum, sync: :beat4 do
    stop
    
    sample :drum_heavy_kick
    sample :bd_ada
    sleep 0.5
    sample :drum_heavy_kick
    sample :sn_dolf
    sleep 1
    sample :drum_cymbal_closed
    sleep 2.5
  end
  
  live_loop :hats, sync: :beat do
    stop
    
    sample :drum_cymbal_closed, sustain: 0, release: 0.03
    sleep 0.5
  end
end
# 1st experiment END

# We ended this one here

# 2nd experiment
live_loop :beat do; sleep 1; end
live_loop :beat4, sync: :beat do; sleep 4; end
live_loop :beat8, sync: :beat do; sleep 8; end
live_loop :beat12, sync: :beat do; sleep 12; end
live_loop :beat16, sync: :beat do; sleep 16; end
live_loop :beat64, sync: :beat do; sleep 64; end

with_fx :sound_out_stereo, output: 5 do
  
  live_loop :boom, sync: :beat12 do
    stop
    
    with_fx :level, amp: 0 do
      sn = synth :prophet, note: :e1, release: 10, cutoff: 100
      sleep 1
      sn = synth :prophet, note: :e1, release: 10, cutoff: 90
      sleep 1
      sn = synth :prophet, note: :e1, release: 10, cutoff: 80
      sleep 10
    end
  end
  
  live_loop :ambi, sync: :beat do
    stop
    
    with_fx :level, amp: 1 do
      sample :ambi_dark_woosh, rate: (rrand 0.125, 1.5)
      sleep rrand(0.2, 2)
    end
  end
  
  live_loop :drone, sync: :beat do
    stop
    
    sample :ambi_drone, rate: (rrand 0.125, 1.5), amp: 0.5
    sleep 1
  end
  
  live_loop :drum, sync: :beat4 do
    tick_reset
    4.times do tick
      if look == 0 then
        with_fx :echo do
          sample :drum_bass_soft
        end
      end
      sleep 1
    end
  end
  
  live_loop :bell do
    sync :beat16
    
    with_fx :reverb, mix: 1 do
      sample :drum_cowbell, beat_stretch: 3
    end
    
  end
  
  live_loop :chords, sync: :beat4 do
    set(:coff, 70)
    with_fx :level, amp: 0.1 do
      with_fx :ring_mod, freq: :e4 + 7, mod_amp: 1, mix: 1 do
        synth  :tb303, note: chord(:e4, :m), sustain: 2, release: 0, cutoff: get(:coff)
      end
      sleep 2
      with_fx :ring_mod, freq: :b3 + 8, mod_amp: 1, mix: 1 do
        synth  :tb303, note: chord(:b3, '+5'), sustain: 2, release: 0, cutoff: get(:coff)
      end
      sleep 2
      with_fx :ring_mod, freq: :b3 + 7, mod_amp: 1, mix: 1 do
        synth  :tb303, note: chord(:b3, :M), sustain: 2, release: 0, cutoff: get(:coff)
      end
      sleep 2
      with_fx :ring_mod, freq: :g3 + 7, mod_amp: 1, mix: 1 do
        synth  :tb303, note: chord(:g3, :M), sustain: 2, release: 0, cutoff: get(:coff)
      end
      sleep 2
      with_fx :ring_mod, freq: :d4 + 7, mod_amp: 1, mix: 1 do
        synth  :tb303, note: chord(:d4, '6'), sustain: 2, release: 0, cutoff: get(:coff)
      end
      sleep 2
      with_fx :ring_mod, freq: :d4 + 7, mod_amp: 1, mix: 1 do
        synth  :tb303, note: chord(:a3,  :m7), sustain: 8, release: 0, cutoff: get(:coff)
      end
      sleep 8
    end
  end
  
  live_loop :lead, sync: :beat4 do
    stop
    with_fx :level, amp: 0 do
      use_synth :tb303
      use_random_seed 1000
      a = scale(:e4, :minor)
      
      16.times do
        with_fx :echo,  max_phase: 1, phase: 0.25 / 2 , room: 0.4 do
          play a.choose, sustain: 0.25, release: 0, cutoff: 50
          sleep 0.25
        end
      end
    end
  end
  
  live_loop :rand_surfer, sync: :beat4 do tick
    notes = (scale :e2, :minor_pentatonic, num_octaves: 2)
    use_random_seed 1000
    
    16.times do
      synth :hoover, note: notes.choose, release: 0.1, cutoff: rrand(70, 120), amp: 0.2
      sleep 0.125
    end
  end
  
  live_loop :haha do
    sync :beat64
    
    with_fx :krush do
      sample :guit_e_slide, amp: 0.7
    end
    
    with_fx :panslicer do
      sample "/Volumes/GoogleDrive/My Drive/leadersheep/laugh.wav", rate: -1
    end
  end
end

with_fx :sound_out_stereo, output: 5 do
  sync :beat16
  
  ##| sample "/Volumes/GoogleDrive/My Drive/leadersheep/le-consulting-c-de-la-merde.wav"
  
  
  ##| sample :ambi_choir, rate: -1
  ##| with_fx :octaver, amp: 4 do
  ##|   sample "/Volumes/GoogleDrive/My Drive/leadersheep/hoyeah.ogg", beat_stretch: 2
  ##| end
end

# 2nd experiment END
