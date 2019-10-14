---
layout: single
title:  "Getting Started with Voice Driven Development"
date:   2019-09-02 17:36:34 -0700
categories: blog
tags: talon
toc: true
excerpt: "A beginner's guide to voice coding with Talon. Topics: Basic Input, Numbers, Symbols, Arrow Keys, Modifiers, Multipliers, Help, Words and Phrases, Formatters."

---
You've decided to try using speech recognition to write code. You've installed all the things, you've got a decent microphone, and it's time to start talking to your computer, but where do you start? If you are feeling like "HOW DO I EVEN" with voice coding, I've compiled some learning strategies and tips to help you get started.

This post assumes that you already have a working voice set up with both [Talon](https://talonvoice.com/) and Dragon Dictation installed and either [my Talon Configs][] or [Talon Community repository][] cloned into `~/.talon/user`. If you need help with the set up, check out the [Talon docs](https://talonvoice.com/docs/index.html#document-index), join the [Talon Slack][], and check out [this video](https://www.youtube.com/watch?v=oB5TGMEhQp4&feature=youtu.be) house9Tube put together.
{: .notice--info}

_Talon is under rapid development, so these examples may change._
{: .notice--danger}

When starting to work with Talon, it's important to remember that Talon is the API ([what is an API](https://medium.com/@perrysetgo/what-exactly-is-an-api-69f36968a41f)) that allows building hands-free functionality using Python. All the examples you will see in this post are implementations using Talon's API; they do not come with Talon by default. You can find all the code for the examples in this post either in [my Talon Configs] or [Talon Community Repository]. Saving them to `~/.talon/user` will load them into Talon and they will be automatically ready to use. Because all the functionality lives in a collection of Python files, everything is highly customizable to your workflow and preferences. Learning to voice code will be about learning to use functionality already implemented by others while making customizations to fit your unique workflow.

When looking at modules in [my Talon Configs][] or [Talon Community repository][], voice command definitions are inside a dictionary passed into the 'keymap' method on the context, like this:

```python
from talon.voice import Context
context = Context("example")
context.keymap({
	# say "give me a string", output is "string"
	"give me a string": "string",

	# press keys using Key
	"select all": Key("cmd-air"),
	"select all": Key("cmd air"), # equivalent

	# alternative commands in ()
	# say: "sellect all" or "cell all"
	"(select | cell) all": Key("cmd-air"),
	})

	# optional commands in []
	# say either "select all" or "all"
	"[select] all": Key("cmd-air"),

	# right side can be an array
	# output is () with cursor inside
	"args": ["()", Key("left")]
})
```
Commands can also be mapped to python functions for more advanced functionality, which is not covered in this post.

If you are making customizations and wondering the syntax to specify keys in your commands, see the [Key List](https://github.com/dwighthouse/unofficial-talonvoice-docs/blob/master/docs/KeysList.md).

# Basic Input
## The Alphabet
Example from [my Talon basic.py][] (equivalent in [Talon Community repository][] is [basic_keys.py](https://github.com/dwiel/talon_community/blob/master/misc/basic_keys.py)).
{: .notice--warning}

Learning the alphabet is a great place to start. It's a bite-size set of commands to learn, and you will use them constantly (spelling, keyboard shortcuts, vim, etc.) so it's important to have quick recall. The alphabet is a set of words where each word is a command for a single letter key. The alphabet is customizable, but I recommend using another voice coder's alphabet as a starting point rather than inventing your own from scratch. You can find one in the [Talon Community repository][], or start with mine:

![alphabet commands](/assets/alphabet.png)

Newcomers to voice coding often ask why not use the NATO Phonetic Alphabet:

![NATO alphabet](/assets/NATO.png)

With one exception, all the NATO words have more than one syllable (e.g., November has three) and are not efficient for commands like the alphabet that you will use frequently. _If you have questions about international language support, join [Talon Slack][]._

**Go Practice!**
Spell some words using the alphabet. Spending some time upfront developing efficient recall will pay off. Most of the other voice commands are easy enough to learn as you go, or reference when you need them, but the alphabet is essential.
{: .notice}

## Numbers
Example from [my Talon basic.py][] (equivalent in [Talon Community repository][] is [basic_keys.py](https://github.com/dwiel/talon_community/blob/master/misc/basic_keys.py)).
{: .notice--warning}
Numbers should be easy: "one" for 1, "two" for 2, etc. For more than one digit, chain them, e.g., "one two five" for 125.

## Symbols
Example from [my Talon symbols.py][] (equivalent in [Talon Community repository][] is [basic_keys.py](https://github.com/dwiel/talon_community/blob/master/text/symbol.py)).

Some basic symbols:
```python
"question [mark]": "?",
"tilde": "~",
"(bang | exclamation point)": "!",
"dollar [sign]": "$",
"(downscore | underscore)": "_",
"colon": ":",
"(paren | left paren)": "(",
"(rparen | are paren | right paren)": ")",
"(bracket | brack | left bracket)": "{",
"(rbrack | are bracket | right bracket)": "}",
"(angle | left angle | less than)": "<",
"(rangle | are angle | right angle | greater than)": ">",
"(star | asterisk)": "*",
"(pound | hash [sign] | octo | thorpe | number sign)": "#",
"percent [sign]": "%",
"caret": "^",
"at sign": "@",
"(and sign | ampersand )": "&",
"pipe": "|",
```

Optimization examples combining symbols:
```python
"arrow": "->",
"dub arrow": "=>",
"op dub": " => ",
"(op | is) equal": " == ",
"(op | is) not equal": " != ",
"(op | is) greater [than] or equal": " >= ",
"(op | is) less [than] or equal": " <= ",
```

**Go Practice!**
Get familiar with the commands for symbols. With most mapped to a straightforward command, e.g., "dollar" for $, "percent" for %, this shouldn't require much effort.
{: .notice}

## Arrow Keys
Example from [my Talon basic.py][] (equivalent in [Talon Community repository][] is [basic_keys.py](https://github.com/dwiel/talon_community/blob/master/misc/basic_keys.py)).
{: .notice--warning}
Arrow keys are important for basic navigation and keyboard shortcuts. You will use them frequently enough that the commands should be simple, but bare "up", "down", etc. will be unintentionally triggered often. I recommend using a prefix, for example "go up", "go down", "go left", etc. If you cloned the [my Talon Configs][] or the [Talon Community repository][], these already have the prefix "go".

## Modifiers
Example from [my Talon basic.py][] (equivalent in [Talon Community repository][] is [basic_keys.py](https://github.com/dwiel/talon_community/blob/master/misc/basic_keys.py)).
{: .notice--warning}
You can reference most modifiers using their key name, e.g. "control" for Control, "command" for Command. Because "shift" can be difficult to say, I recommend an alternative like "ship". Practice combining the modifier keys with the alphabet to use your favorite keyboard shortcuts.

At this point, you should be able to hit all the common keys on the keyboard and have access to significant functionality on your computer using these keys and keyboard shortcuts. A majority of the commands I have in my Talon libraries are just easier to remember shorthands for using keyboard shortcuts. It's worth spending time familiarizing yourself with available keyboard shortcuts in your favorite applications and later making voice commands where it improves your workflow.

**Example voice commands for keyboard shortcuts:**

From [my Talon standard.py][]

```python
"save": Key("cmd-s"),
"copy": Key("cmd-c"),
"cut": Key("cmd-x"),
"menu help": Key("cmd-shift-?")
```

From [my Talon generic_editor.py][]
```python
"push": Key("cmd-right"),
"pop": Key("cmd-left"),
"step": Key("alt-right"),
"stone": Key("alt-left"),
```

**Go Practice!**
Try your favorite keyboard shortcuts by combining the alphabet with the modifier keys.
Some examples:
"go right", "go left", "go up", "go down"
"whale odd whale"
"delete"
"ship whale"
"command air"
"one two three"
"percent dollar bang".
{: .notice}

## Multipliers
Example from [my Talon repeater.py][]
{: .notice--warning}
It won't take you long to get frustrated if you are repeating yourself constantly. If you need to make an edit requires saying "delete" 20 times, you may give up or reach for a keyboard, so efficient repetition is important. Talon has a `Rep(n)` function that repeats the last command `n` number of times.

Personally, it feels most natural to say the command first and specify the multiplier as a post-fix ("delete 5 times" vs. "5 times delete"). I often know _what_ I need to do first, and can decide _how many_ as I'm saying the first command. Because many commands might already be long, I want an efficient way to specify repeats. I can't use bare numbers, like "delete 5", because it's ambiguous whether that means "delete once, then the number 5" or "delete 5 times". I could use "once", "twice", "thrice", except it's not common knowlege to know what comes after "thrice", and I may want more than 3 repeats. One way is to make up a bunch of words for the repeats, but that requires inventing and learning a lot of new vocabulary.

My personal solution is to use the [ordinal number words](https://en.wikipedia.org/wiki/Ordinal_numeral). I don't use ordinals often, and I know the ordinal representation higher than I will possibly need without needing to learn any new vocabulary. This has worked well for me. Some examples:


"go down 4th"
 : arrow down 4 times

"delete 10th"
 : delete 10 times 

"select down 12th"
 : select down 12 times


# Command Help
Example from [my Talon help.py][]
{: .notice--warning}

Voice coding requires learning a library of commands to be efficient (typing everything out by individual key would be slow). It isn't realistic to think that you will memorize every possible command, especially if you are continuously iterating on your commands like I do. Because context switching is taxing, using tools to efficiently reference the set of available commands will help maintain the "flow" of coding and have a good quality of work life overall. I noticed an improvement in my own "flow" after I built some command help pop-ups and no longer needed to open up my text editor to reference my commands. These help pop-ups are accessible by voice commands. The voice command (what you say) will appear on the left and output on the right.

Voice commands are grouped to context, for example "sublime", "git", "google_chrome", etc. You will find that most Talon modules have one context name, and some have logic to restrict the context's active state based on some logic, like when an application has focus (e.g., "sublime" context active when Sublime Text has focus) or when working within a file with a specific file extension (e.g., "python" context active for .py extension). The help pop-ups described below will show information on the contexts loaded into Talon and the commands for that context group.

## All Contexts
**"help context"**
This pop-up will show all the contexts Talon has loaded, with inactive contexts faded out. Switching the focus to a different application may change which contexts are active (e.g., Sublime Text context is active if sublime is in focus). From here, you can say "help 1", "help /<context name>", (or click with the mouse) to show commands for that specific context.

![help context](/assets/help_context.png)

## Commands for a Context
**"help \<context name>", e.g., "help sublime"**
This view shows commands for a given context. It can be accessed either via "help context" then "help \<number>", or directly by "help \<context name>".

![help sublime](/assets/help_sublime.png)

## Alphabet
**"help alphabet"**
Just in case you forget the alphabet, there is also a "help alphabet" pop-up, which is pretty straightforward in showing the alphabet commands.

**Go Practice!**
Navigate the help pop-ups using the above commands. To dismiss a pop-up, say (or click) "cancel".
{: .notice}

# Words and Phrases
Example from [my Talon standard.py][]
{: .notice--warning}

## Using Talon Mode
Spelling every word one letter at a time using the alphabet is not efficient. I use a set of commands in my Talon library that allow me to capture full words and phrases. Talon has some syntax `<dgnwords>`, `<dgndictation>`, or the greedy version `<dgndictation>++` which capture text following a command.

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

## Using Dragon Mode
Another option is to switch to `dragon mode` using the "dragon mode" command in [my Talon speech_toggle.py][], which puts Talon in a sleeping state and wakes up Dragon for you to use Dragon directly. Some users who are familiar with Dragon already or do a lot of prose dictation might prefer this approach.

**Go Practice!**
Practice outputting some text. Keep notes on which words or phrases don't work as expected so you can tune later.
{: .notice}

# Formatters
Example from [my Talon formatters.py][]
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

As you can see by the last examples, formatters can be combined.

# General Tips
## Microphone Quality Matters
The built-in microphone on your mac is not going to give you the kind of accuracy that you want, so find yourself a good one. Suggested microphones that are popular in the voice coding community:

1. [Blue Yeti](https://smile.amazon.com/Blue-Yeti-USB-Microphone-Silver/dp/B002VA464S?sa-no-redirect=1) - great mic for the price if you don't have background noise
1. [Stenomask](https://talktech.com/product/steno-sr-pro-1/) - great for dealing with background noise, cheapest model probably also fine
1. [Audio-Technica Pro 8HEx](https://www.audio-technica.com/cms/wired_mics/94a69a7f0cbde4b3/index.html) - basic cardioid XLR microphone
1. [DPA d:fine cardioid](https://www.sweetwater.com/store/detail/4288ESBg--dpa-dfine-core-4288-omnidirectional-flex-earset-microphone-with-microdot-connector-long-length-be) - (4188 or 4288) the best, but expensive

If you're unfamiliar with Stenomask, here's a [video demo](https://www.youtube.com/watch?v=T3WJubnhMEQ).

Join #hardware in [Talon Slack][] for more suggestions.

## Find a Quiet Space
Talking to your computer can feel awkward at first, and you might be self-conscious as you get used to hearing your own voice as you work. Find a quiet space where you feel comfortable talking at a normal volume and not be distracted by what other people think. Also, it's important to minimize background noise so that it doesn't interfere with your accuracy. Some microphones are better about handling background noise. If finding a quiet space isn't an option, find a microphone that will be best for this environment.

## Focus on the Biggest Wins First, then Expand
The bulk of my typing work happens in the text editor, so I focused on getting efficient there first. I spent a week or two building my own module for Sublime Text (there wasn't one when I first started), and practiced writing, editing, and navigating code. I paid attention to when I reached for a keyboard while working on some code, for example, running a test in terminal, or googling something. I tried to learn to use those by voice next. My goal was to get longer and longer blocks of time where I didn't need to touch a keyboard or mouse at all. It takes a while to chip away at all the technology you touch on a day-to-day, but it adds up and pays off. I have days now where I don't need to touch the keyboard at all!

## Copy Some Code
Learning a new input method requires a lot of mental bandwidth. When I first started, I found it helpful to practice reproducing existing code rather than jump right into writing new code. I picked a snippet from my codebase that was a good representation of what I work on, and tried to reproduce an exact copy. I took notes on what felt inefficient and where I experienced inaccuracies so I could later iterate on my Talon libraries, learn new commands, then try to reproduce the same code again.

## Use Simple Tasks for More Practice
Once you are feeling confident enough with copying code, try tackling simple tasks. The first 8 weeks of learning, my team was supportive of me taking on simple and not time sensitive tickets to help me with learning. I knew I'd still have a lot of mental overhead with remembering commands, so this wasn't a good time to tackle a difficult refactor or task requiring more than my text editor and a terminal shell.

## Use Your Talon Library as Dogfood
Implementing new functionality in your voice toolset can be a great way to dogfood your voice coding. I've written most of my libraries using voice, and I often found that new features I wanted were small enough in scope and simple enough to implement that they were great to work on while learning. It's pretty great to get some opportunity to practice but also build new things to improve your workflow.

## Leverage Talon's Community
Talon's Slack community can be a fantastic resource. In my experience, Talon folks have been friendly, welcoming, and full of useful tips. If you have questions or an idea for building a new tool, jump into [Talon Slack][] and say "Hi"! There's a good chance someone may have already written the thing you need. If not, people will be happy to help answer questions and help you along. As the technology matures and more users come along, we like to share the cool things we are building and help support each other.

## Feedback
If you have feedback on this post or have content requests, please reach out. You can contact me on twitter as [@yomilly](https://twitter.com/yomilly?lang=en) or in [Talon Slack][] as @2shea. Thanks! 🐳🥤

[Talon Slack]: https://join.slack.com/t/talonvoice/shared_invite/enQtMjUzODA5NzQwNjYzLTY1NzZjNzM4NjVhZjZhYWFlNmZkYmU2YzE2ZjQxZjcyMTgwNDk5NDg2YzhmZDRmNmEwYThkODEyYjY4ZGZmODE
[Talon Community repository]: https://github.com/dwiel/talon_community
[my Talon Configs]: https://github.com/2shea/talon_configs
[my Talon help.py]: https://github.com/2shea/talon_configs/blob/master/misc/help.py
[my Talon symbols.py]: https://github.com/2shea/talon_configs/blob/master/text/symbols.py
[my Talon basic.py]: https://github.com/2shea/talon_configs/blob/master/misc/basic.py
[my Talon standard.py]: https://github.com/2shea/talon_configs/blob/master/misc/standard.py
[my Talon generic_editor.py]: https://github.com/2shea/talon_configs/blob/master/text/generic_editor.py
[my Talon repeater.py]: https://github.com/2shea/talon_configs/blob/master/misc/repeater.py
[my Talon speech_toggle.py]: https://github.com/2shea/talon_configs/blob/master/misc/speech_toggle.py
[my Talon formatters.py]: https://github.com/2shea/talon_configs/blob/master/text/formatters.py
