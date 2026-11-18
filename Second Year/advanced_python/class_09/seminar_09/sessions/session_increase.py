from flask import Flask, session

app = Flask(__name__)
app.secret_key = "randomstring"


@app.route('/') 
def increase():

  current = session.get("i", 0)     # начинаем с 0, увеличиваем i каждый раз
  session["i"] = current + 1
  return str(current)                # возвращаем i

app.run()