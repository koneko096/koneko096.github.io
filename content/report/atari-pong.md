+++
categories = ["artificial intelligence", "machine learning", "experiment", "deep learning", "reinforcement learning"]
tags = []
date = "2017-12-28"
draft = true
title = "Deep Reinforcement Learning Note 1 - Playing Pong with Policy Gradient"
+++

It's been over a year since AlphaGo wins its match versus Lee Sedol with great victory. And not so long ago, AlphaGo Zero --self taught version of AlphaGo-- has been [published](https://deepmind.com/blog/alphago-zero-learning-scratch/). One of the core component of AlphaGo is DQN --deep Q-network which had successfully completed a diverse of [classic Atari games](https://deepmind.com/research/dqn/).

{{< figure src="https://boygeniusreport.files.wordpress.com/2016/03/google-alphago-go-win.jpg" title="Lee Sedol during the match" >}}

Following the success of DQN, deep reinforcement learning (RL) at general has gained much popularity. The recent breakthroughs from OpenAI been released (like [this](http://www.gamersgreed.com/openai-uses-gta-v-to-train-ai-for-driving/) and [this](https://blog.openai.com/more-on-dota-2/)), has proved further capabilities of deep RL. In this post, I'm going to tell my story about building a simple deep RL agent to play Atari Pong.

# Lets Start with Some Theory

Before we dive into RL, I suggest you to understand about machine learning in general and a bit about Python and linear algebra. If you need resources about it, here are bunch of interesting resources to learn ML:

- [Machine Learning is Fun!](https://medium.com/@ageitgey/machine-learning-is-fun-80ea3ec3c471)
- [Learning to See by Welch Lab](https://www.youtube.com/playlist?list=PLiaHhY2iBX9ihLasvE8BKnS2Xg8AhY6iV)
- [Machine learning course videos by Andrew Ng](https://www.youtube.com/playlist?list=PLA89DCFA6ADACE599). You could also enroll in his course on Coursera
- [Neural Networks Demystified by Welch Lab](https://www.youtube.com/playlist?list=PLiaHhY2iBX9hdHaRr6b7XevZtgZRa1PoU)
- [Neural net course videos by Geoffrey Hinton](https://www.youtube.com/playlist?list=PLoRl3Ht4JOcdU872GhiYWf6jwrk_SNhz9) (Coursera mirror)

Reinforcement learning is an exciting area of machine learning. It can be classified somewhat between supervised and unsupervised learning. Because basically it is the learning method to make an efficient strategy in a given environment. 

There are few core component of reinforment learning: **environment state**, **action**, **observation state**, **policy**, and **reward**. Agent will make action for every timestep. Every action from the agent will affect the environment. And then environment will make feedback with reward and change of environment state. Depend on the problems, environment state will be observed by agent to make update to internal state of agent --called observation state.

{{< figure src="https://cdn-images-1.medium.com/max/1600/1*HvoLc50Dpq1ESKuejhICHg.png" title="RL loopback" >}}

Main goal of RL is to determine the best policy in order to maximize the rewards. This process can be modeled as the optimisation problem, like gradient ascent or hill climbing. But now, how we can measure policy performance? There are 2 main approaches, **policy based method** and **value based method**.

# Get to the Observation

# Ready to Train!

# Conclusions

# References
- Reinforcement Learning: An Introduction by Sutton
- [Deep Reinforcement Learning Demysitifed (Episode 2) — Policy Iteration, Value Iteration and Q-learning](https://medium.com/@m.alzantot/deep-reinforcement-learning-demysitifed-episode-2-policy-iteration-value-iteration-and-q-978f9e89ddaa)
- [Pong with Reinforcement Learning Tutorial](http://karpathy.github.io/2016/05/31/rl/)
- [Simple RL Series with Tensorflow](https://medium.com/@awjuliani/super-simple-reinforcement-learning-tutorial-part-2-ded33892c724)
- [Lecture slide from David Silver](http://www0.cs.ucl.ac.uk/staff/d.silver/web/Teaching_files/pg.pdf)
- [Summary and additional resources about policy gradient method](https://github.com/dennybritz/reinforcement-learning/tree/master/PolicyGradient)

