# Sync/Cue

# Making sure to keep the tempo in sync
live_loop :_every_1, sync: :go do; sleep 1;end
live_loop :_every_4, sync: :_every_1 do; sleep 4; end
live_loop :_every_8, sync: :_every_1 do; sleep 8; end
live_loop :_every_16, sync: :_every_1 do; sleep 16; end

# This loop might become desynchonised if one change
# the sleep statement
live_loop :test, sync: :_every_1 do # Init params, used to kick in the live_loop
  play :e4, release: 0.4
  sleep 0.5
end

live_loop :test_every_1 do
  sync :_every_1 # Body params, can replace sleep statements
  
  play :g4, release: 0.4
end

live_loop :test_every_4 do
  sync :_every_4
  
  play :b4, release: 0.4
end

# Init the sound !
if true then
##| if false then
  s = sample :drum_roll, amp_slide: bt(1), amp: 1
  control s, amp: 4
  sleep bt(1)
  control s, amp: 0.5
  sleep bt(1.5)
  control s, amp: 4
  sleep bt(1)
  control s, amp: 0.5
  sleep bt(1.5)
  control s, amp: 6
  sleep bt(1.0)
  cue :go
end

