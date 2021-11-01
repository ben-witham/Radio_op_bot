# Overview

This is a helper for the radio operator in the Captain Sonar board game! Captain Sonar is a board game for up to 8 people, and there are 2 teams against each other in submarines. The submarine teams can only locate each other by listening to where the other team is moving. This program is supposed to help with that. It's actually more of a cheat, because of how easy it is, but it's pretty basic right now.

The player has a map of the ocean they're fighting in, and four buttons denoting north, east, south and west. As the other team moves, the radio operator will press the buttons, and the game will show all the possible locations for the enemy submarine.

This is actually a part of a bigger project I'm working on, which will be a bot for the entire other team. I love the game Captain Sonar, but it plays best at 8 players, which is usually pretty hard to get together. With the bot, you'll be able to play a fulfilling game with less people. 

I've been working on the bot, but I'm not making as much progress as I'd like, so I'm making it in parts starting with the radio operator, and this is to make a really good radio operator then move on to other components.

I've included all the project files below if you'd like to look at my code, but if you just want to use the software, there's also going to be an exe file that will play the game.

[Here's the video demonstration](http://youtube.link.goes.here)

# Development Environment

This game was made in the Godot game engine, which is an open source game engine that I'm beginning to love. The game is made by putting scenes together which then act like a object - oriented language. There's much more to discover, and I'm interested in using this more. It's also very small for a game engine which is good for the rapidly dwindling space I have on my hard drive.

The language used is called GDscript, a language custom-made for Godot. It's similar to python in that it's a simple non-type-set language. 

# Useful Websites

* You can download Godot [here](https://godotengine.org/download/windows). The export libraries are also on this page.
* [This is the Godot Documentation](https://docs.godotengine.org/en/stable/index.html)
* [HeartBeast](https://www.youtube.com/user/uheartbeast) has very good youtube tutorials
* [This](https://discord.com/invite/zH7NUgz) is the invite for the Godot discord, which has a very active help community. I didn't use this, but it may be useful to others.
* [These forums](https://godotforums.org/) really helped with all the strange bugs I encountered.

# Future Work

There's quite a lot that I'd still like to work on for this!
* Sonar, drone, and other functionality. Having that information can really help the bot pin down the enemy sub position. I'm thinking of having an array of requirements with a timestamp of sorts, and if the path doesn't meet all of those requirements, it is thrown out.
* Silence handling. One of the things the enemy team can do is silence, which means that your possible locations branch of into a bunch of different spots. I want to add this so that the bot can take whatever is thrown at it.
* Beautification. It looks kinda ugly right now.
* Finishing the other bigger bot. Once it's done I'll put the entire bot here.