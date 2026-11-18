from flask import Flask, session, render_template_string

app = Flask(__name__)
app.secret_key = "randomstring"

@app.route('/dark/')
def on():
    session['dark'] = True
    return "Set to Dark"


@app.route('/light/')
def off():
    session['dark'] = False
    return "Set to Light"

@app.route('/')
def show():
    dark = session.get("dark", False)
    
    return "<body bgcolor={}></body>".format("#000" if dark else "#fff")

if __name__ == '__main__':
    app.run()