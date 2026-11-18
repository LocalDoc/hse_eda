# Импортируем объект сессии
from flask import Flask, session

app = Flask(__name__)
app.secret_key = "randomstring"


@app.route('/add/<item>/')
def add_to_cart(item):

    # Получаем либо значение из сессии, либо пустой список
    cart = session.get("cart", [])
    # Добавлям элемент в список
    cart.append(item)
    # Записываем список обратно в сессию
    session['cart'] = cart

    return "Item {} added".format(item)


@app.route('/')
def show_cart():
    return "You have {} in your cart".format(", ".join(session.get("cart", ["nothing"])))


@app.route('/reset/')
def reset_cart():
    # удаляем корзину из сессии
    session.pop("cart")
    return "Cart is empty!"

app.run(debug=True)