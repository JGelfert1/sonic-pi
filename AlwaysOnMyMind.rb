# Welcome to Sonic Pi v2.11

use_bpm 120

live_loop :strings do
  with_fx :reverb do
    with_fx :flanger do
      use_synth :tri
      use_synth_defaults amp: 1, cutoff: 60, sustain: 0.3
      play_chord chord(:C3, :major, invert: 2), release: 5
      sleep 4
      play_chord chord(:G3, :major, invert: 0), release: 5
      sleep 4
      play_chord chord(:A3, :minor, invert: 0), release: 1.99
      sleep 2
      play_chord chord(:G3, :major, invert: 0), release: 1.99
      sleep 2
      play_chord chord(:F3, :major, invert: 0), release: 5
      sleep 4
    end
    
  end
  
end


live_loop :synthriff do
  
  use_synth :dsaw
  
  play_chord chord(:C3, :major, invert: 2)
  sleep 4
  4.times do
    play_chord chord(:G3, :major, invert: 0)
    
    sleep 0.5
  end
  sleep 1
  play_chord chord(:C3, :major, invert: 2)
  
  sleep 1
  play_chord chord(:F3, :major, invert: 0)
  
  sleep 4
  4.times do
    play_chord chord(:F3, :major, invert: 0)
    
    sleep 0.5
  end
  sleep 1
  play_chord chord(:G3, :major, invert: 0)
  
  sleep 0.5
end

define :oktbass do |ton, repeats|
  repeats.times do
    play ton
    sleep 0.5
    play ton + 12
    sleep 0.5
  end
end


define :hihat8 do
  
  4.times do
    8.times do
      sample :drum_cymbal_closed
      sleep 0.5
    end
    
  end
end
live_loop :hihat do
  hihat8
end



live_loop :drums do
  4.times do
    2.times do
      sample :drum_heavy_kick
      sleep 1
      sample :drum_heavy_kick, rate: 3, amp: 2
      sleep 1
    end
  end
end






live_loop :bass do
  use_synth :subpulse
  use_synth_defaults amp: 4, cutoff: 70
  oktbass :C2, 4
  oktbass :G1, 4
  oktbass :A1, 2
  oktbass :G1, 2
  oktbass :F1, 3
  oktbass :G1, 1
  
end