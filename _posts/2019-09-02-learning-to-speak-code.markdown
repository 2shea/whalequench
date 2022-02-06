---
layout: single
title:  "Getting Started with Voice Driven Development"
date:   2019-09-02 17:36:34 -0700
categories: blog
tags: talon
toc: true
excerpt: "A beginner's guide to voice coding with Talon. Topics: Basic Input, Numbers, Symbols, Arrow Keys, Modifiers, Multipliers, Help, Words and Phrases, Formatters."

---
You've decided to try using speech recognition to write code. You have [completed the Talon setup](https://talon.wiki/getting_started/), you have a [microphone](https://talon.wiki/hardware/), and it is time to start talking to your computer. But where do you start? If you are feeling like "HOW DO I EVEN" with voice coding, I've compiled a few tips and learning strategies to help you get started.

This post assumes that you already have a working Talon setup. If you need help with the setup, check out the [Getting Started](https://talon.wiki/getting_started) page on the [Talon Community Wiki][]. Feel free to ask questions in the [Talon Slack][] as needed if you run into any trouble.
{: .notice--info}

_Talon is under rapid development. Details related to the features and functionality described in this post may change. If you have arrived here after watching one of my public conference talks, please note that Talon's API has gone through some changes since the talk, and the syntax may be different than example code in my talks.
{: .notice--danger}


When starting to work with Talon, it is important to remember that Talon is the API ([what is an API](https://medium.com/@perrysetgo/what-exactly-is-an-api-69f36968a41f)) that allows building hands-free functionality using Python. All the examples you will see in this post are implementations using Talon's API; they do not come with Talon by default. You can find all the code for the examples in this post in the [Talon Community Repository], which is the canonical respository maintained by community members and used by most Talon users. Saving this repository to your Talon `user` directory (`~/.talon/user` on Mac, `"%APPDATA%\Talon\user"` on Windows) will load the configuration into Talon, and the features (voice commands, etc.) provided by that repository will be automatically ready to use. Because all the functionality lives in a collection of Python files, everything is highly customizable to your workflow and preferences. Learning to voice code will be about learning to use the functionality already implemented by others, while also making customizations where needed to fit your unique workflow.

When looking at modules in the [Talon Community repository][], voice command definitions are inside `.talon` files. The voice command (what you should say) will be on the left, and the resulting action on the right.


```python
# say "give me a string", resulting output is "string"
give me a string: "string",

# say "press return", Talon presses the 'return' key
press return: key(return)

# say "select all", Talon presses both cmd and a keys simultaneously
select all: key(cmd-a),

# alternative commands in ()
# say: "select all" or "cell all"
(select | cell) all: key(cmd-a),

# optional commands in []
# say either "select all" or "all"
[select] all: key(cmd-a),

# right side can include multiple actions
# result output is () with cursor inside
args:
  insert("()")
  key(left)

```
Commands can also be mapped to python functions for more advanced functionality, which is not covered in this post.

# Basic Input
## The Alphabet
Learning the alphabet is a great place to start. It's a bite-size set of commands to learn, and you will use them constantly (spelling, keyboard shortcuts, vim, etc.) so it's important to have quick recall. The alphabet is a set of words where each word is a command for a single letter key. The alphabet is customizable, but I recommend using the alphabet in the [Talon Community repository][] as a starting point rather than inventing your own from scratch. This alphabet was designed by the Talon author, Ryan Hileman, to be efficient and phonetically diverse. Start here and only make modifications if you need to:

![alphabet commands](/assets/alphabet.png)

Newcomers to voice coding often ask why not use the NATO Phonetic Alphabet:

![NATO alphabet](/assets/NATO.png)

With one exception, all the NATO words have more than one syllable (e.g., November has three) and are not efficient for commands like the alphabet that you will use frequently._If you have questions about international language support, join [Talon Slack][]._

If you do find that you need to modify the alphabet, the [Talon Community repository README][] will have instructions and a link to where the alphabet is defined.

**Go Practice!**
Spell some words using the alphabet. Spending some time upfront developing efficient recall will pay off. Most of the other voice commands are easy enough to learn as you go, or reference when you need them, but the alphabet is essential.
{: .notice}

## Numbers
Numbers are straightforward: "one" for 1, "two" for 2, etc. For more than one digit, chain them, e.g., "one two five" for 125.

## Symbols
The commands for symbols will mostly match the expected key name for those symbols. Here are some examples from the [Talon Community repository][]:
```python
question [mark]: "?"
dollar: "$",
(downscore | underscore): "_"
double dash: "--"
(bracket | brack | left bracket): "{"
(rbrack | are bracket | right bracket): "}"
plus: "+"
arrow: "->"
dub arrow: "=>"
star: "*",
hash: "#",
percent: "%",
caret: "^",
amper: "&",
at sign: "@",
pipe: "|",
```

If you would like to learn more of the symbols, the [Talon Community repository README][] has links to where you can find the symbols in the repository, or you can reference the symbols help menue by saying 'help symbols'.

For convenience and efficiency, it is nice to have commands for common symbol combinations. These are  simplified examples for the sake of this post (these commands may not exist exactly as written in the [Talon Community repository][] as they have some added layers of indirection to account for language-specific syntax):
```python
arrow: "->",
dub arrow: "=>",
op dub: " => ",
(op | is) equal: " == ",
(op | is) not equal: " != ",
(op | is) greater [than] or equal: " >= ",
(op | is) less [than] or equal: " <= ",
```

**Go Practice!**
Get familiar with the commands for symbols. With most mapped to a straightforward command, e.g., "dollar" for $, "percent" for %.
{: .notice}

## Arrow Keys
Arrow keys are important for basic navigation and keyboard shortcuts. You will use them frequently enough that the commands should be simple, but bare "up", "down", etc. will be unintentionally triggered often. I recommend using a prefix, for example "go up", "go down", "go left", etc. If you are using the [Talon Community repository][], these already have the prefix "go".

## Modifiers
You can reference most modifiers using their key name, e.g. "control" for Control, "command" for Command. Because "shift" can be difficult to say, you may consider using an alternative like "ship". Practice combining the modifier keys with the alphabet to use your favorite keyboard shortcuts.

At this point, you should be able to hit all the common keys on the keyboard and have access to significant functionality on your computer using these keys and keyboard shortcuts. Many of the remaining commands are just easier to remember shorthands for keyboard shortcuts or combinations of keys. It's worth spending time familiarizing yourself with available keyboard shortcuts in your favorite applications and later making voice commands where it improves your workflow.

**Example voice commands for keyboard shortcuts:**

```python
save: Key("cmd-s"),
copy: Key("cmd-c"),
cut: Key("cmd-x"),
menu help: Key("cmd-shift-?")
```

**Go Practice!**
Try your favorite keyboard shortcuts by combining the alphabet with the modifier keys.
Some examples:
"go right", "go left", "go up", "go down"
"whale odd whale"
"delete"
"ship whale" # capital W
"command air"
"one two three"
"percent dollar bang".
{: .notice}

## Multipliers
It won't take you long to get frustrated if you are repeating yourself constantly. If you need to make an edit that requires saying "delete" 20 times, you may give up or reach for a keyboard, so efficient repetition is important. Talon has a `core.repeat_command(n)` function that repeats the last command `n` number of times.

Personally, it feels most natural to say the command first and specify the multiplier as a post-fix ("delete 5 times" vs. "5 times delete"). I often know _what_ I need to do first, and can decide _how many_ as I'm saying the first command. Because many commands might already be long, I want an efficient way to specify repeats. I can't use bare numbers, like "delete 5", because it's ambiguous whether that means "delete once, then the number 5" or "delete 5 times". I could use "once", "twice", "thrice", except it's not common knowlege to know what comes after "thrice", and I may want more than 3 repeats. One way is to make up a bunch of words for the repeats, but that requires inventing and learning a lot of new vocabulary.

My personal solution was to use the [ordinal number words](https://en.wikipedia.org/wiki/Ordinal_numeral). I don't use ordinals often, and I know the ordinal representation higher than I will possibly need without needing to learn any new vocabulary. This has worked well for me. Some examples:


"go down 4th"
 : arrow down 4 times

"delete 10th"
 : delete 10 times 

"select down 12th"
 : select down 12 times


# Command Help
Voice coding requires learning a library of commands to be efficient (typing everything out by individual key would be slow). It isn't realistic to think that you will memorize every possible command, especially if you are continuously making changes to your commands. Because context switching is taxing, using tools to efficiently reference the set of available commands will help maintain the "flow" of coding and have a good quality of work life overall. I noticed an improvement in my own "flow" after I built some command help pop-ups and no longer needed to open up my text editor to reference my commands. These help pop-ups are accessible by voice commands. The voice command (what you say) will most often appear on the left and output on the right. These help pop-ups have now been ported to using a newer version of Talon and have undergone some changes, but mostly they work the same as the ones I built. what do we do with you how 

Voice commands are grouped to context, for example "sublime", "git", "google_chrome", etc. You will find that most Talon modules have one context name, and some have logic to restrict the context's active state based on some logic, like when an application has focus (e.g., "sublime" context active when Sublime Text has focus) or when working within a file with a specific file extension (e.g., "python" context active for .py extension). The help pop-ups described below will show information on the contexts loaded into Talon and the commands for that context group.

## All Modules
**"help context"**
This pop-up will show all the modules Talon has loaded. It will show both active and inactive, but the active ones will be marked. Switching the focus to a different application may change which modules are active (e.g., Sublime Text module is active if sublime is in focus). From here, you can say "help next" to display the next page of modules or "help /<module name>" to show commands for that specific module. The buttons on the help pop-ups are also clickable with a mouse.

![help context](/assets/help_context.png)

## Active Modules
**help active**
This pop-up will show only the active modules, which may be more useful as it will filter out many of the inactive modules you are not using.

![help active](/assets/help_active.png)

## Commands for a Module
**"help \<module name>", e.g., "help git"**
This view shows commands for a given module. It can be accessed either via "help context" then "help \<module name>", or directly by "help \<module name>". The modules listed in the "help context" pop-up in are also clickable with a mouse.

![help sublime](/assets/help_git.png)

## Closing Help
**help close**
The help pop-ups can be close with the command "help close" or by clicking the close button.

## Alphabet
**"help alphabet"**
If you need to reference the alphabet, there is also a "help alphabet" pop-up.

**Go Practice!**
Navigate the help pop-ups using the above commands. To dismiss a pop-up, say (or click) "help close".
{: .notice}

# Words and Phrases
## Using Talon Mode
Spelling every word one letter at a time using the alphabet is not efficient, but there are some commands built into the [Talon Community repository][] that capture full words and phrases:

**phrase**
The "phrase" command will capture everything you say after "phrase" and output it. For example, "phrase hello world" will output "hello world". There's an optional version of this command that ends the capture when it hears "over", so "phrase hello world over one" would output "hello world1".

**word**
The "word" command is like phrase, but captures only the next word following the command. For example, "word hello" will output "hello".

**sentence**
The "sentence" command is similar to the "phrase" command, except it will capitalize the first word following "phrase", so "sentence hello world" will output "Hello world".

## Using Dictation Mode
Another option is to switch to `dictation mode` using the "dictation mode" command, which will will capture and output anything you say except for a limited set of words which function as commands. The available commands in dictation mode can be found in the [dictation mode talon file](https://github.com/knausj85/knausj_talon/blob/master/modes/dictation_mode.talon) in the Talon Community repository. Punctuation commands for dictation mode can be found in the [keys talon file](https://github.com/knausj85/knausj_talon/blob/master/code/keys.py#L128-L157) in the Talon Community repository.

**Go Practice!**
Practice outputting some text. Keep notes on which words or phrases don't work as expected so you can tune later.
{: .notice}

# Formatters
When writing code, words often need to be formatted, e.g. snake_case, camelCase, etc. It's handy to have a set of text formatting commands which will capture a string of words then format the output. These are example formatters, which are defined in the [Talon Community repository][] at the time of this writing:

**snake**
"snake hello world" --> `hello_world`

**camel**
"camel hello world" --> `helloWorld`

**kebab**
"kebab hello world" --> `hello-world`

**dotted**
"dotted hello world" --> `hello.world`

**dubstring**
"dubstring hello world" --> `"hello world"`

**smash**
"smash hello world" --> `helloworld`

**title**
"title hello wolrd" --> `Hello World`"HELLO WORLD"

**allcaps**
"allcaps hello world" --> `HELLO WORLD`HELLO WORLD

**combining formatters**
"allcaps dotted hello world" --> `HELLO.WORLD`
"allcaps dotted dubstring hello world" --> `"HELLO.WORLD"`

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
Learning a new input method requires a lot of mental bandwidth. When I first started, I found it helpful to practice reproducing existing code rather than jump right into writing new code. I picked a snippet from my codebase that was a good representation of what I work on, and tried to reproduce an exact copy. I took notes on what felt inefficient and where I experienced inaccuracies so I could later iterate on libraries, learn new commands, then try to reproduce the same code again.

## Use Simple Tasks for More Practice
Once you are feeling confident enough with copying code, try tackling simple tasks. The first 8 weeks of learning, my team was supportive of me taking on simple and not time sensitive tickets to help me with learning. I knew I'd still have a lot of mental overhead with remembering commands, so this wasn't a good time to tackle a difficult refactor or task requiring more than my text editor and a terminal shell.

## Use Your Talon Library as Dogfood
Implementing new functionality in your voice toolset can be a great way to dogfood your voice coding. I've written most of my libraries using voice, and I often found that new features I wanted were small enough in scope and simple enough to implement that they were great to work on while learning. It's pretty great to get some opportunity to practice but also build new things to improve your workflow.

## Leverage Talon's Community
Talon's Slack community can be a fantastic resource. In my experience, Talon folks have been friendly, welcoming, and full of useful tips. If you have questions or an idea for building a new tool, jump into [Talon Slack][] and say "Hi"! There's a good chance someone may have already written the thing you need. If not, people will be happy to help answer questions and help you along. As the technology matures and more users come along, we like to share the cool things we are building and help support each other.

## Feedback
If you have feedback on this post or have content requests, please reach out. You can contact me on twitter as [@yomilly](https://twitter.com/yomilly?lang=en) or in [Talon Slack][] as @2shea. Thanks! 🐳🥤

[Talon Slack]: https://talonvoice.com/chat
[Talon Community Wiki]: https://talon.wiki
[Talon Community repository]: https://github.com/knausj85/knausj_talon
[Talon Community repository README]: https://github.com/knausj85/knausj_talon/blob/master/README.md
