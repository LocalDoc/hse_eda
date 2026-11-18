from flask import Flask, session

app = Flask(__name__)
app.secret_key = "randomstring"

@app.route('/login/')
def login():

    session['id'] = 1357
    session['name'] = "Mary Jane"
    return "User data set"

@app.route('/logout')
def logout():

    session.pop("id")
    session.pop("name")
    return "User data removed"

@app.route('/')
def index():
    return "Id: {} Name: {}".format(session.get('id'), session.get('name'))

app.run()