#!/usr/bin/env python3

from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"

@app.route("/hej")
def hello2():
    return "Helloooo World!"

if __name__ == "__main__":
    app.run()
