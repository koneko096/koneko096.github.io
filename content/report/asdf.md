+++
categories = ["programming", "software development"]
tags = ["version manager", "automation", "devops"]
date = "2018-03-23"
title = "asdf -- Simple and Customizable One-for-all Version Manager"
+++

Lately, I've been experimenting with Elixir to create simple functional microservices. Beside the language itself, the one thing need to explore are environment tools, like version and package manager. In Elixir, at least there are 2 env managers; [kiex](https://github.com/taylor/kiex) and [exenv](https://github.com/mururu/exenv). Also, in my box already installed [nvm](https://github.com/creationix/nvm), [rbenv](https://github.com/rbenv/rbenv), and soon [gvm](https://github.com/moovweb/gvm). Managing all these tools can be so excruciating. So I will introduce our hero here, [asdf](http://github.com/asdf-vm/asdf)!

# asdf?!

> Extendable version manager with support for Ruby, Node.js, Elixir, Erlang & more
>
> **asdf README**

asdf is an customizable version manager with support for Ruby, Node.js, Go, Python, Lua, Clojure, Elixir and Erlang. It was created by Akash Manohar ([@HashNuke](http://github.com/HashNuke)) and was designed to replace all the language-specific version managers. It’s also 100% shell script, which makes it easy to install and relatively portable. asdf doesn’t include support for any language directly. Each language is supported via a plugin that contains all the language specific version management details. asdf’s plugin system makes it easy to install, upgrade and remove plugins as needed. The plugin system also makes it easy to add support for new languages by third parties. asdf plugins are just plain old git repositories with a few shell scripts in them. Installation of a plugin can be done with the `asdf plugin-add` command.

# Now What?

## Install

Before we can install it, we need to satisfy dependencies first.

```
# For Ubuntu-based distro users
$ apt-get install automake autoconf libreadline-dev libncurses-dev libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev

# For macOS user (don't forget to install homebrew first)
$ brew install coreutils automake autoconf openssl libyaml readline libxslt libtool unixodbc
```

Then we can proceed to installation

```
$ git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.3
```

## Environment configuration

```
# For Ubuntu with bash users
$ echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
$ echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc

# For Zsh users
$ echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc
$ echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc
```

## Plugins installation

Now install plugin required

```
$ asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
$ asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
$ asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git

# Imports Node.js release team's OpenPGP keys to main keyring
$ bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

$ asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
```

## Usage

Installing platform version become so simple

```
$ asdf install ruby 2.4.2
$ asdf install nodejs 8.7.0
$ asdf install erlang 20.1
```

Then, you can set environment on your box (global) or local directory

```
$ asdf global ruby 2.4.2
$ asdf global elixir 1.5.2

$ asdf local ruby 2.3.4
```

So you see how easy to manage platform and version using asdf. After you know this tools you can forget all about NVM, RVM, or anything. Just one tools to maintain all of your projects.

