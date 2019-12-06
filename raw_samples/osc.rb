# Some OSC fun with the TouchOSC app (iphone)

# Notes :
# - Uncheck "Enforce timing garantees" to use real time options
# - Check "Receive OSC messages on port: xxxx"
# - This is using the default "beatmachine" layout in touchOSC

# Globals
set :att, 1.0
set :rel, 1.0

# Listeners
live_loop :control_coff do
  use_real_time
  
  a, = sync "/osc/1/fader1"
  set :att, 2 * a
end

live_loop :control_rel do
  use_real_time
  
  b, = sync "/osc/1/fader2"
  set :rel, 2 * b
end

live_loop :control_both do
  use_real_time
  
  a, b = sync "/osc/4/xy"
  set :att, 2 * a
  set :rel, 2 * b
end

live_loop :trigger_e4 do
  use_real_time
  
  a, = sync "/osc/1/push1"
  play :e4, attack: get(:att), release: get(:rel) if a == 1
end

live_loop :trigger_b4 do
  use_real_time
  
  a, = sync "/osc/1/push2"
  play :b4, attack: get(:att), release: get(:rel) if a == 1
end

