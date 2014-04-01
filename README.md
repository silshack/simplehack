Simplehack
================
A teaching application built on [Simple](https://github.com/orf/simple), a clone of [Obtvse](http://github.com/NateW/obtvse).  Wired for teaching by [gerbal](http://github.com/gerbal) and [eah13](http://github.com/eah13).

The License is NSFW but there is no doubt that you can do whatever you want to with this code.


## Help students deploy a web app in under an hour
This repo is designed to be the simplest introduction to web programming around.  The goal is to get students with basic Python knowledge up and deployed in under an hour.  Then, it's up to you as the instructor to explain what's happened :)

Prerequisites:

* Students with basic command line and python knowledge (really the ability to follow command line instructions is all that matters)
* git 
* The Heroku toolbelt installed. (`pip install heroku`)
* Everyone signed up for free [Nitrous.io](http://nitrous.io) accounts.  A suitable web development environment will work great as well; just remove/alter the Nitrous references below and the `--user` from the `pip install` statements.

## Student instructions
(You can deploy an instance of this app and paste these instructions into the first post if you like.  They might need a little cleanup since they were first written for my UNC class)

[TOC]

## A Heroku app 

To host our site so other can see it we are going to use [Heroku](http://heroku.com), a really cool Platform as a Service that lets us test and host all kinds of web apps for free. 

Go to [Heroku](https://id.heroku.com/signup/www-header) and [sign up for an account](https://id.heroku.com/signup/www-header). Confirm your account and sign in.

A free account is more than good enough for our purposes.

Create a new app  

![heroku new app](http://i.imgur.com/IU9gEFV.png)

Name it something you can remember, preferably **SILSHACK-_GITHUBNAME_**


## Simple in Nitrous.io  

To getting the blog up and running. In the Nitrous terminal (or the Nitrous IDE console):

```bash
$ git clone https://github.com/silshack/simplehack.git #get the simple blog
$ cd simplehack
$ pip install --user -r requirements.txt #install all of our required libraries, this may produce errors. Don’t worry.
$ python create_config.py --fresh # configure your blog - you can presse 'enter' to accept the defaults
```  
This has created a new file, which we'll need to commit.  Heroku can't see anything unless it's committed.
```bash
$ git status     # view the changes
$ git add .      # add them
$ git status     # see them added
$ git commit -m "Created Config" 
```

Here's an Asciicast of this on a demo Nitrous box:

<script type="text/javascript" src="https://asciinema.org/a/7804.js" id="asciicast-7804" async></script>


## Simple and a Database on Heroku 

Now we want to get our  Simple site up on Heroku.

Back in Nitrous.io, in your _simplehack/_ directory do the following  
Don't copy and paste these commands, because you'll have to customize some of them.

```bash  
$ heroku login
$ heroku keys:add
$ git remote add heroku git@heroku.com:(appname).git   # replace (appname) with your heroku name above.
```

### Databasin

Next we need to create a Database for our site. We can do this by running the following commands:

```bash
$ heroku addons:add heroku-postgresql
```

Now we need to tell Simple that the database we just made exists. We can do this running a script included in SimpleHack

```bash
$ ./setupenv1.sh
$ source ~/.bashrc
$ ./setupenv2.sh
```

Then run

```bash
$ git add .
$ git commit -m "SimpleHack should be up and working now" 
$ git push heroku master
```

Now go to **http://_appname_.herokuapp.com** and see your working blog in action.

Here's and Asciicast of this section:

<script type="text/javascript" src="https://asciinema.org/a/7805.js" id="asciicast-7805" async></script>


## Trouble?

An earlier version of the script was broken.  If you're having trouble, do this:

To get the most recent script, run 

```bash
$ git pull origin master
```

Then, run the script a second time:

```bash
$ ./setupenv1.sh
$ source ~/.bashrc
$ ./setupenv2.sh
```

This has modified some stuff, which we'll need to commit and push.
```bash
$ git status     # view the changes
$ git add .      # add them
$ git status     # see them added
$ git commit -m "SimpleHack should be up and working now" 
$ git push heroku master
```

Thanks to Katie for noticing the lack of commits at the end.

If the above doesn't work for you (it has for many), delete **both your simplehack folder and your Heroku app** and start over from scratch.  The videos above should help.

## What's Next?

Now, it's up to you. Go look at **_simple.py_**. That is the entire application running your blog. Break it, experiment with it, do something completely different.

Simple is built with [Flask](http://flask.pocoo.org/) A really cool and really simple Python Web Framework. 

You can log in as an admin and make posts by going to http://your-app-url.com/admin and typing in the user name and password you specified.  The default is 'admin' and 'password'.

Here's a video demonstrating that: [http://recordit.co/rcmhNB](http://recordit.co/rcmhNB)

![Live](http://i.imgur.com/tsiSsED.png)


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/orf/simple/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

