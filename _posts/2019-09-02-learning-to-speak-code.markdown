---
flayout: post
title:  "Learning to Speak Code"
date:   2019-09-02 17:36:34 -0700
categories: blog
tags: talon
author: Emily Shea
---
So you've decided to try using speech recognition to write code. You've installed all the things and it's time to start talking to your computer, but where to start? Learning a new keyboard layout can be daunting, so an even more extreme change to using speech can be very intimidating, or even seem impossible. If you are looking to use voice and feeling like "OMG HOW DO I EVEN", I've compiled some learning strategies and tips to help you get started.

_This post assumes that you already have a working voice set up and that you are using [Talon](https://talonvoice.com/) and Dragon Dictation. If you need help with the set up, check out the [Talon docs](https://talonvoice.com/docs/index.html#document-index), join the [Talon Slack][], and check out this video on the basics made by a Talon user **TODO credit video**._

<iframe width="560" height="315" src="https://www.youtube.com/embed/oB5TGMEhQp4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


# Start with the Basics

### Learning The Alphabet
Learning the alphabet is a great place to start. It's a bite-size set of commands to learn, and they will be used all the time (spelling, keyboard shortcuts, vim, etc.) so it's important to be able to recall them quickly. The alphabet is a set of words where each word is a command for a letter key. The alphabet can be customized, but I recommend using another voice coder's alphabet as a starting point. You can find one in the [Talon Community repository][], or start with mine:

> air bat cap dip each far gone harp sit jury crunch look mad near odd pit quench red sun trap urge vest whale plex yank zip

Newcomers to voice coding often ask why not use the NATO Phonetic Alphabet (Alpha, Bravo, …)? Many of the NATO words are multiple syllables (e.g., November) and are not as efficient, which is important because the alphabet commands will be used all the time. **If you have questions about international language support, join [Talon Slack][].**

***
> #### Go Practice!
Spell some words using the alphabet. Spending some time upfront to get efficient recall will pay off. Most of the other voice commands are easy enough to learn as you go, or reference when you need them, but the alphabet is essential.

***

### Numbers
Numbers should be easy: "one" for 1, "two" for 2, etc. For multiple digits, chain them, e.g., "one two five" for 125.

### Symbols
Get comfortable with the commands for symbols. Most can be easily mapped to something easily remembered, e.g., "dollar" for $, "percent" for %. 

### Arrows
Arrow keys are important for basic navigation and keyboard shortcuts. They are used frequently enough that the commands should be simple, but bare "up", "down", etc. are likely to get accidentally triggered often. I recommend adding a prefix, for example "go up", "go down", "go left", etc. If you have the Talon Community repository, these will already be prefixed with "go".

### Modifiers
Most modifiers can be reference using their key name, e.g. "control" for Control, "command" for Command. Because "shift" can be difficult to say, many voice coders use "ship". Practice combining the modifier keys with the alphabet to use your favorite keyboard shortcuts. At this point, you can do almost anything a keyboard can do, but probably not as efficient just yet.

***

> #### Go Practice!
Try your favorite keyboard shortcuts by combining the alphabet with the modifier keys, e.g. "ship air" for `A` (capitalized) or "command sun" for save.

***

# Command Help
Voice coding requires learning a library of commands to be efficient. Typing everything out by individual key would be infuriatingly slow. Being able to reference the set of available commands quickly and easily is important to maintain "the flow" of coding (we all know context switching is taxing). It isn't realistic to think that you will memorize all of the commands, especially if you are iterating on your commands all the time like I do, so having them handy is important.

I built some command help webviews which can be accessed using voice commands. I have mine set up with three help commands (what you say will appear on the left, output on the right):

### "help alphabet"
![help alphabet](/assets/help_alphabet.png)
### "help context"
![help context](/assets/help_context.png)
### "help \<context name>", e.g., "help sublime"
![help sublime](/assets/help_sublime.png)

You can find the code for these webviews in the [Talon Community repository] or [my Talon help.py].

***

> #### Go Practice!
Navigate the help webviews using the above commands. To dismiss a webview, say "cancel".

***

# Words and Phrases
Spelling every word using the alphabet would not be very efficient. Some users switch to `dragon mode` and use dragon directly, but I most often use a set of commands in my Talon library that allow me capture full words and phrases. Talon has some syntax `<dgnwords>`, `<dgndictation>`, or the greedy version `<dgndictation>++` which capture text following a command.

"phrase <dgndictation> [over]"
 : "phrase hello world" => `hello world`
 : "phrase hello world phrase hello world" => `hello worldhello world`

"(say | speak) <dgndictation>++ [over]"
 : "say hello world"  => `hello world`
 : "say hello world say hello world"  => `hello world say hello world`

"sentence <dgndictation> [over]"
 : "sentence hello world" => `Hello world`

"word <dgnwords>"
 : "word hello" => `hello`


***

> #### Go Practice!
Practice reading some text.

***


# Formatters
When writing code, words often need to be formatted, e.g. snake_case, camelCase, etc. It's handy to have a set of text formatting commands which will capture a string of words then format the output.


"dunder"
 : __hello__

"camel"
 : helloWorld

"snake"
 : hello_word

"smash"
 : helloworld

"kebab"
 : hello-world

"pack"
 : hello::world

"title"
 : Hello World

"allcaps"
 : HELLO WORLD

"dubstring"
 : "hello world"

"string"
 : 'hello world'

Formatters can be combined:

"kebab title"
 : Hello-World

"pack title"
 : Hello::World

"allcaps smash"
 : HELLOWORLD

"allcaps smash dubstring"
 : "HELLOWORLD"

# Practice Copying Code
Learning a new input method requires a lot of mental bandwidth. When I first started, it was helpful to practice reproducing already existing code rather than jump right into writing new code. I picked a few snippets of code from my codebase that were a good representation of the code I work on, and tried to reproduced exactly. I took notes on what felt inefficient or where I experienced inaccuracies so I could later iterate on my talon libraries and learn new commands.

# Use Simple Tasks for Practice


# Switching Applications









[Talon Slack]: https://join.slack.com/t/talonvoice/shared_invite/enQtMjUzODA5NzQwNjYzLTY1NzZjNzM4NjVhZjZhYWFlNmZkYmU2YzE2ZjQxZjcyMTgwNDk5NDg2YzhmZDRmNmEwYThkODEyYjY4ZGZmODE
[Talon Community repository]: https://github.com/dwiel/talon_community
[my Talon libraries]: https://github.com/2shea/talon_configs
[my Talon help.py]: https://github.com/2shea/talon_configs/blob/master/help.py

Jekyll also offers powerful support for code snippets:

{% highlight ruby %}
def print_hi(name)
  puts "Hi, #{name}"
end
print_hi('Tom')
#=> prints 'Hi, Tom' to STDOUT.
{% endhighlight %}

Check out the [Jekyll docs][jekyll-docs] for more info on how to get the most out of Jekyll. File all bugs/feature requests at [Jekyll’s GitHub repo][jekyll-gh]. If you have questions, you can ask them on [Jekyll Talk][jekyll-talk].

[jekyll-docs]: https://jekyllrb.com/docs/home
[jekyll-gh]:   https://github.com/jekyll/jekyll
[jekyll-talk]: https://talk.jekyllrb.com/
