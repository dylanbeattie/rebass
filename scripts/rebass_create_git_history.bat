md rebass
cd rebass
git init -b main . 
echo kickdrum > kickdrum
git add kickdrum
git commit -m "4/4 LinnDrum kick pattern #doof" 
git push
git checkout -b cymbals 
echo cymbals > cymbals
git add cymbals
git commit -m "Pi-hat and crash cymbal loop" 
git commit --amend -m "Hi-hat and crash cymbal loop"
git push --set-upstream origin cymbals
git checkout -b drums 
echo snare > snare
git add snare
git commit -m "Electro snare with NAND gate reverb" 
git push --set-upstream origin drums
git checkout main 
git checkout -b bass 
echo bass > bass
echo bass >> song
git add bass
git add song
git commit -m "Import legacy code bass" 
git push --set-upstream origin bass
git checkout main 
git checkout -b echo-guitar 
echo echo guitar > echo-guitar
echo echo guitar > song
git add echo-guitar
git add song
git commit -m "echo echo guitar > echo-guitar" 
git push --set-upstream origin echo-guitar
git checkout main 
git checkout -b guitar2 
echo guitar2 > guitar2
git add guitar2
git commit -m "Kernel panic! at the disco"
git push --set-upstream origin guitar2
git checkout bass 
git checkout -b all-the-guitars 
echo conflict > song
git add song
git commit -m "simulate merge conflict"
git merge echo-guitar 
echo resolved >> song
git add song
git commit -m "Resolved merge conflict" 
git push --set-upstream origin all-the-guitars
git merge drums
git merge guitar2 
git push
git checkout main 
git checkout -b synth-bass 
echo synth-bass > synth-bass
git add synth-bass
git commit -m "Time sequence data bass" 
git push --set-upstream origin synth-bass
git merge drums
git push
git checkout -b synth-pads
echo right-pad > right-pad
echo left-pad > left-pad
git add right-pad
git add left-pad
git commit -m "Add right-pad and left-pad" 
git push --set-upstream origin synth-pads
git checkout -b all-the-things 
git merge all-the-guitars 
git push
git checkout main 
echo vocoder > vocoder
git add vocoder
git commit -m "Vocoder #daftpunk #gitlucky"
git push
git merge echo-guitar 
git push
git rebase all-the-things
git pull
git push
echo lead-guitar > lead-guitar
git add lead-guitar
git commit -m "Tech lead guitar"
git push
cd ..
