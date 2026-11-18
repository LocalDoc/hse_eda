from flask import Flask, render_template

app = Flask(__name__)


@app.route("/")
def main():
    return render_template("index.html")


@app.errorhandler(404)
def render_not_found(error):
    return "Ничего не нашлось! Вот неудача, отправляйтесь на главную!"


@app.errorhandler(500)
def render_server_error(error):
    return "Что-то не так, но мы все починим"



if __name__ == '__main__':
    app.run(port=5002, debug=True)
