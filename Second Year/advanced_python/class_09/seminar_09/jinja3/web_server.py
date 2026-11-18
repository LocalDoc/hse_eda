from flask import Flask, render_template

app = Flask(__name__)


def get_items_from_database():
    return [
        {"name": "Яблоко", "price": 50},
        {"name": "Банан", "price": 30},
        {"name": "Апельсин", "price": 40},
    ]

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/list')
def item_list():
    items = get_items_from_database()
    return render_template('list.html', items=items)


if __name__ == '__main__':
   app.run()