[![Melpa Status](http://melpa.org/packages/windswap-badge.svg)](http://melpa.org/#/windswap)
[![Melpa Stable Status](http://stable.melpa.org/packages/windswap-badge.svg)](http://stable.melpa.org/#/windswap)
[![Build Status](https://github.com/purcell/windswap/actions/workflows/test.yml/badge.svg)](https://github.com/purcell/windswap/actions/workflows/test.yml)
<a href="https://www.patreon.com/sanityinc"><img alt="Support me" src="https://img.shields.io/badge/Support%20Me-%F0%9F%92%97-ff69b4.svg"></a>

# Swap Emacs windows with their neighbours

If you enjoy using `windmove`, this package is an add-on for you: it
has variants of the `windmove` commands which swap the buffers as you
move, so that you get the effect of "dragging" windows around
directionally with the arrow keys.

_Update: as of Emacs 27.1, there are `windmove-swap-*` commands that
are mostly identical to this package, with the exception that they
will happily swap the contents of dedicated windows, while `windswap`
refuses to do so: this seems like a better behaviour to me._

## Installation

You can install `windswap` from the
[MELPA](http://melpa.org) repository. The version of
`windswap` there will always be up-to-date.

Add global key bindings for `windswap`'s commands manually, or use the
convenient `windswap-default-keybindings` function.

```elisp
(windmove-default-keybindings 'control)
(windswap-default-keybindings 'control 'shift)
```

## About

Author: Steve Purcell <steve at sanityinc dot com>

Homepage: https://github.com/purcell/windswap

This little library was extracted from the author's
[full Emacs configuration](https://github.com/purcell/emacs.d), which
readers might find of interest.

<hr>

[💝 Support this project and my other Open Source work](https://www.patreon.com/sanityinc)

[💼 LinkedIn profile](https://uk.linkedin.com/in/stevepurcell)

[✍ sanityinc.com](http://www.sanityinc.com/)

[🐦 @sanityinc](https://twitter.com/sanityinc)
