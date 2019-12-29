# Faking the sea

##
# using noise and curved-triangular fades to simulate the sound of waves
#
# TODO: Add more randomness and wave superposition
##
define :tri do |synth_name, n, total_dur|
  val = rrand(1, 4)
  synth synth_name,
    note: n,
    attack: val,
    sustain: 0,
    release: total_dur - val,
    env_curve: 3
end

live_loop :sea do
  total_duration = 5
  if one_in(2) then
    tri(:bnoise, :c3, total_duration)
  else
    tri(:bnoise, :c3, total_duration)
    delta = rrand(0.5, 1.5)
    time_warp delta do
      tri(:bnoise, :c3, total_duration)
    end
    
  end
  sleep total_duration
end



