# re:bass
*If Git was music, what would it sound like?*

https://user-images.githubusercontent.com/106178/134353306-702fb9cb-c33c-4907-a29c-294879313283.mp4

**re:bass** is an original musical composition inspired by Git. Rhythms and melodies diverge, conflict, merge and resolve like branches in a codebase. Drums, guitars, synthesizers and vocals build up in layers, creating parallel arrangements based around a common chord structure until finally the branches combine into a musical crescendo.

### Making re:bass

This project dates way back to 2016, when Axosoft held a [songwriting competition](https://dylanbeattie.net/2016/04/15/the-axosoft-gitkraken-songwriting-battle.html) to celebrate the [launch of GitKraken 1.0](https://www.gitkraken.com/blog/gitkraken-version-1-launch-contest). That's what originally gave me the idea of trying to interpret concepts like branches, merges and rebases as elements in a musical composition. The idea floated around for a while, and when I was invited to present something at [GitKon 2021](https://gitkon.com/) I took the opportunity to revisit the idea and see if I could do something with it.

### The music

The music required around ten distinct instruments and patterns, each of which had to work as an isolated instrument, in various combinations, and as part of the full arrangement which ends the piece. I actually started with the final section and worked backwards, removing elements from the full mix until just the 4/4 kickdrum pattern was left. That gave me the structure of the final song; each instrument was then recorded individually. The drums and synthesizers are all built-in instruments in Logic Pro X; the bass is a Peavey Millennium 5-string, the guitar is a Fender Strat running straight into Logic. The vocoder effect is [iZOTOPE VocalSynth 2](https://www.izotope.com/en/products/vocalsynth.html).

### The video

The video was created in Adobe After Effects. The visualization graph, commit messages, animations and visual effects were all drawn and animated by hand directly in After Effects; there are a *lot* of complicated mask keyframes and nested compositions going on. The viz graph is inspired by the visualisations seen in [GitKraken](https://www.gitkraken.com/), although for artistic reasons mine starts at the top and time flows downwards.

### The console transcript

Now, remember: **this is art**. Git does not actually work this way; we don't (yet) have any tools and file formats that will let you branch, merge and rebase music in real time. This is a composition inspired by the way I think about branching and merging when I'm working on a codebase. 

That said, I wanted the console transcript that appears in the video to be as close as possible to the actual commands that you'd use to create the song.

Using text files in place of actual instruments, I figured out the exact sequence of Git commands that would create the network graph shape I was looking for, and turned this into a Windows batch file:

* [scripts/rebass_create_git_history.bat](scripts/rebass_create_git_history.bat)

This meant I could recreate the graph history in an empty folder, or run individual commands to check what effect they'd have on the graph.

To produce the scrolling console effect that appears in the video, I captured the output from the batch file, and went through it line-by-line adding individual frame numbers to each block of text, with "chunks" delimited by four hyphens `----`. For lines where I needed a typing effect, I specified the first and final frame numbers of the typing animation; for output messages which appear immediately, I specified only the frame number where the text should appear.

The whole file is [scripts/console-simulator-transcript.txt](scripts/console-simulator-transcript.txt)

```
20-52 $ git init -b main . 
----
70 Initialized empty Git repository in /home/dylan/songs/rebass/.git/
----
80-91 $ git add kickdrum
----
140-185 $ git commit -m "4/4 LinnDrum kick pattern #doof" 
----
185 [main (root-commit) edd5150] 4/4 LinnDrum kick pattern #doof
 1 file changed, 1 insertion(+)
 create mode 100644 kickdrum
----
190-225 $ git checkout -b cymbals 
----
225 Switched to a new branch 'cymbals'
----
232-279 $ git add cymbals
----
```

Next, I wrote a custom After Effects import script that would parse this text file and create the video elements described by each line. I won't get into the gritty detail of how After Effects scripting works, but if you're interested, the import script is here:

* [scripts/ae-console-simulator.js](scripts/ae-console-simulator.js)

I ran this script in a 1920x9600 pixel composition (think nine HD monitors stacked one above the other) to create the animated console transcript. To create the scrolling effect, I imported this into a second 1920x1080 composition, and used a JS expression to control the transcript's position:

```js
y = 0;
leading = comp("transcript").layer(1).text.sourceText.style.leading;
for(i = 1; i <= comp("transcript").numLayers; i++) {
	if (comp("transcript").layer(i).active) {
		y += (comp("transcript").layer(i).text.sourceText.split('\r').length - 1);
	}
}
(3840 - leading) + ((y < 1 ? 0 : (1 - y) * leading));
```

It took a while to figure all this out, but it meant I could edit the transcript file, rerun the import scripts, and recreate everything automatically instead of having to animate effects and transitions by hand.

### This repository

Finally, just for fun, I set up a real project on GitHub (you're looking at it!) and ran the git history script against it. If you head over to [https://github.com/dylanbeattie/rebass/network](https://github.com/dylanbeattie/rebass/network) you'll see the network graph for this project is the same as the structure of the song. 

Yes, I am that much of a nerd.

I added a few extra snippets of code and this README, and, well, here it is. Happy listening.

### Links

* **re:bass** and all my other music projects are at [dylanbeattie.net/music/](https://dylanbeattie.net/music/)
* [**re:bass** on YouTube](https://youtu.be/S9Do2p4PwtE)
* I'm [@dylanbeattie](https://twitter.com/dylanbeattie?lang=en) on Twitter







