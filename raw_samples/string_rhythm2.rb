define :to_ring do |a|
  return a.chars.map{|e| e=='x' ? true : false}.ring
end

live_loop :drummy2, sync: :beat4 do
    dtime = 1.0 / 8.0
    drum_cc    = to_ring('x-x-xx--')
    drum_hk    = to_ring('x---x---')
    drum_sh    = to_ring('xx-x--x-')
    
    use_random_seed 10000
    tick_reset
    with_fx :level, amp: 1.5 do
      8.times do tick
        sample :drum_cymbal_closed, rate: 10 if drum_cc.look
        sample :drum_bass_soft if drum_hk.look
        sample :bass_hit_c, rate: 1.26, amp: rrand(0.1, 0.8) if drum_sh.look
        
        sleep dtime
      end
    end
  end