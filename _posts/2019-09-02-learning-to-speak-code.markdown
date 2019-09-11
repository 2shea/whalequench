---
layout: single
title:  "Learning to Speak Code"
date:   2019-09-02 17:36:34 -0700
categories: blog
tags: talon
toc: true
excerpt: "A beginner's guide to learning voice coding with Talon."

---
You've decided to try using speech recognition to write code. You've installed all the things, you've got a decent microphone, and it's time to start talking to your computer, but where do you start? If you are feeling like "OMG HOW DO I EVEN" with voice coding, I've compiled some learning strategies and tips to help you get started.

This post assumes that you already have a working voice set up and that you are using [Talon](https://talonvoice.com/) and Dragon Dictation. If you need help with the set up, check out the [Talon docs](https://talonvoice.com/docs/index.html#document-index), join the [Talon Slack][], and check out [this video](https://www.youtube.com/watch?v=oB5TGMEhQp4&feature=youtu.be) house9Tube put together.
{: .notice--info}

_Talon is under rapid development, so the examples may change._
{: .notice--danger}

When starting to work with Talon, it's important to remember that Talon is the API that allows building hands-free functionality using python. All of the examples you will see in this post are implemented using Talon's API; they do not come with Talon by default. You can find all the code for the examples in this post either in [my Talon Libraries] or [Talon Community Repository]. Saving them to your `~/.talon/user` will load them into Talon and they will be ready to use. Because all of the functionality lives in a collection of python files, everything is highly customizable to your workflow and preferences. Learning to voice code will be about learning to use functionality already implemented by others, but also making customizations as you need.


# Basic Input
## The Alphabet
Example from [basic.py](https://github.com/2shea/talon_configs/blob/master/basic.py).
{: .notice--warning}


Learning the alphabet is a great place to start. It's a bite-size set of commands to learn, and they will be used all the time (spelling, keyboard shortcuts, vim, etc.) so it's important to have quick recall. The alphabet is a set of words where each word is a command for a letter key. The alphabet is customizable, but I recommend using another voice coder's alphabet as a starting point rather than inventing your own from scratch. You can find one in the [Talon Community repository][], or start with mine:

> air bat cap dip each far gone harp sit jury crunch look mad near odd pit quench red sun trap urge vest whale plex yank zip

Newcomers to voice coding often ask why not use the NATO Phonetic Alphabet (Alpha, Bravo, …)? Many of the NATO words are multiple syllables (e.g., November) and are not as efficient, which is important because the alphabet commands will be used all the time. _If you have questions about international language support, join [Talon Slack][]._

> **Go Practice!**
Spell some words using the alphabet. Spending some time upfront to get efficient recall will pay off. Most of the other voice commands are easy enough to learn as you go, or reference when you need them, but the alphabet is essential.

## Numbers
Example from [basic.py](https://github.com/2shea/talon_configs/blob/master/basic.py).
{: .notice--warning}
Numbers should be easy: "one" for 1, "two" for 2, etc. For multiple digits, chain them, e.g., "one two five" for 125.

## Symbols
Example from [symbols.py](https://github.com/2shea/talon_configs/blob/master/symbols.py).
{: .notice--warning}
Get comfortable with the commands for symbols. Most can be easily mapped to something easily remembered, e.g., "dollar" for $, "percent" for %. 

## Arrow Keys
Example from [basic.py](https://github.com/2shea/talon_configs/blob/master/basic.py).
{: .notice--warning}
Arrow keys are important for basic navigation and keyboard shortcuts. They are used frequently enough that the commands should be simple, but bare "up", "down", etc. are likely to get accidentally triggered often. I recommend adding a prefix, for example "go up", "go down", "go left", etc. If you have the Talon Community repository, these will already be prefixed with "go".

## Modifiers
Example from [basic.py](https://github.com/2shea/talon_configs/blob/master/basic.py).
{: .notice--warning}
Most modifiers can be referenced using their key name, e.g. "control" for Control, "command" for Command. Because "shift" can be difficult to say, many voice coders use "ship". Practice combining the modifier keys with the alphabet to use your favorite keyboard shortcuts. At this point, you can do almost anything a keyboard can do, but probably not as efficient just yet.

> **Go Practice!**
Try your favorite keyboard shortcuts by combining the alphabet with the modifier keys.
> Some examples:
> "go right", "go left", "go up", "go down"
> "whale odd whale"
> "delete"
> "ship whale"
> "command air"

# Command Help
Example from [help.py](https://github.com/2shea/talon_configs/blob/master/help.py).
{: .notice--warning}

Voice coding requires learning a library of commands to be efficient (typing everything out by individual key would be very slow). It isn't realistic to think that you will memorize all of the commands, especially if you are iterating on your commands all the time like I do. Because context switching is pretty taxing, it is important to be able to reference the set of available commands quickly and easily to maintain "the flow" of coding and have a good quality of work life.

I built some command help pop-ups which can be accessed using voice commands. What you say will appear on the left, output on the right.

## All Contexts
**"help context"**
This pop-up will show all the contexts Talon has loaded, with inactive contexts faded out. Switching the focus to a different application may change which contexts are active (e.g., Sublime Text context only active when sublime is in focus). From here, you can say "help 1" (or click with the mouse) to show commands for that specific context.

![help context](/assets/help_context.png)

## Commands for a Context
**"help \<context name>", e.g., "help sublime"**
This view shows commands for a given context. It can be accessed either via "help context" then "help \<number>", or directly by "help \<context name>".

![help sublime](/assets/help_sublime.png)

I also have a "help alphabet" pop-up, which is pretty straightforward (shows the alphabet). You can find the code for these pop-ups in the [Talon Community repository] or [my Talon help.py].

> **Go Practice!**
Navigate the help pop-ups using the above commands. To dismiss a pop-up, say (or click) "cancel".

# Words and Phrases
Example from [standard.py](https://github.com/2shea/talon_configs/blob/master/standard.py).
{: .notice--warning}

Spelling every word using the alphabet would not be very efficient. Some users switch to `dragon mode` and use Dragon directly, but I most often use a set of commands in my Talon library that allow me to capture full words and phrases. Talon has some syntax `<dgnwords>`, `<dgndictation>`, or the greedy version `<dgndictation>++` which capture text following a command.

phrase \<dgndictation> [over]
 : "phrase hello world" &rarr; `hello world`
 : "phrase hello world phrase hello world" &rarr; `hello worldhello world`

(say | speak) \<dgndictation>++ [over]
 : "say hello world"  &rarr; `hello world`
 : "say hello world say hello world"  &rarr; `hello world say hello world`

sentence \<dgndictation> [over]
 : "sentence hello world" &rarr; `Hello world`

word \<dgnwords>
 : "word hello" &rarr; `hello`

> **Go Practice!**
Practice outputting some text. Keep notes on which words or phrases don't work as expected so you can tune later.


# Formatters
Example from [standard.py](https://github.com/2shea/talon_configs/blob/master/standard.py).
When writing code, words often need to be formatted, e.g. snake_case, camelCase, etc. It's handy to have a set of text formatting commands which will capture a string of words then format the output.

(dunder | camel | snake | kebab | pack | title | allcaps | dubstring | string)+ \<dgndictation> [over]
 : "dunder hello" &rarr; `__hello__`
 : "camel hello world" &rarr; `helloWorld`
 : "snake hello world" &rarr; `hello_word`
 : "smash hello world" &rarr; `helloworld`
 : "kebab hello world" &rarr; `hello-world`
 : "pack hello world" &rarr; `hello::world`
 : "title hello world" &rarr; `Hello World`
 : "allcaps hello world" &rarr; `HELLO WORLD`
 : "dubstring hello world" &rarr; `"hello world"`
 : "string hello world" &rarr; `'hello world'`
 : "kebab title hello world" &rarr; `Hello-World`
 : "pack title hello world" &rarr; `Hello::World`
 : "allcaps smash hello world" &rarr; `HELLOWORLD`
 : "allcaps smash dubstring hello world" &rarr; `"HELLOWORLD"`

As you can see by the last few examples, formatters can be combined.

# General Tips
## Microphone Quality Matters
The built-in microphone on your mac is not going to give you the kind of accuracy that you want, so find yourself a good one. A few microphones that are popular in the voice coding community:

1. [Blue Yeti](https://smile.amazon.com/Blue-Yeti-USB-Microphone-Silver/dp/B002VA464S?sa-no-redirect=1) - great mic (especially for the price) if you don't have background noise
1. [Stenomask](https://talktech.com/product/steno-sr-pro-1/) - great for dealing with background noise, cheapest model probably also fine
1. [DPA d:fine cardioid](https://www.sweetwater.com/store/detail/4288ESBg--dpa-dfine-core-4288-omnidirectional-flex-earset-microphone-with-microdot-connector-long-length-be) - the most highly recommended microphone, but pricey and probably not necessary when starting


## Find a Quiet Space
Talking to your computer can feel awkward at first, and you might be self-conscious as you get used to hearing your own voice as you work. Find a quiet space where you feel comfortable talking at a normal volume and not be distracted by what other people think. Also, it's important that background noise will be at a minimum so it doesn't interfere with your accuracy.

## Copy Some Code
Learning a new input method requires a lot of mental bandwidth. When I first started, it was helpful to practice reproducing already existing code rather than jump right into writing new code. I picked a few snippets from my codebase that were a good representation of what I work on, and tried to reproduced exactly. I took notes on what felt inefficient or where I experienced inaccuracies so I could later iterate on my Talon libraries and learn new commands.

## Use Simple Tasks for More Practice
Once you are feeling confident enough with copying code, try tackling simple tasks. The first few weeks of learning, my team was really supportive of me taking on simple and not time sensitive tickets to help me with learning. I knew I'd still have a lot of mental overhead with remembering commands, so this wasn't a good time to tackle a difficult refactor or task requiring more than my text editor and a terminal shell.

## Use Your Talon Library as Dogfood
Implementing new functionality in your voice toolset can be a great way to dogfood your voice coding. I've written most of my libraries using voice, and I found that many new features I wanted were small enough in scope and simple enough to implement that they were great to work on while learning.

## Did I Mention Talon Slack?
Talon's Slack community can be a really great resource. If you have questions or are thinking about building a new tool, jump into Slack and say Hi! There's a good chance someone has already written the thing you need, or we can help answer questions when you get stuck.

[Talon Slack]: https://join.slack.com/t/talonvoice/shared_invite/enQtMjUzODA5NzQwNjYzLTY1NzZjNzM4NjVhZjZhYWFlNmZkYmU2YzE2ZjQxZjcyMTgwNDk5NDg2YzhmZDRmNmEwYThkODEyYjY4ZGZmODE
[Talon Community repository]: https://github.com/dwiel/talon_community
[my Talon libraries]: https://github.com/2shea/talon_configs
[my Talon help.py]: https://github.com/2shea/talon_configs/blob/master/help.py
