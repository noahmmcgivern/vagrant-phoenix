#!/bin/bash

# Add repository entry
{
    wget -q https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb
    dpkg -i erlang-solutions_2.0_all.deb
    rm erlang-solutions_2.0_all.deb
    apt-get update
}

# Install erlang
apt-get install -y esl-erlang

# Install elixir
apt-get install -y elixir
