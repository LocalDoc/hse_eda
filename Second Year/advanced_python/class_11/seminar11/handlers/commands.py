from aiogram import F, Router, html
from aiogram.filters import CommandStart, Command, StateFilter
from aiogram.types import Message, KeyboardButton, ReplyKeyboardMarkup, ReplyKeyboardRemove
from aiogram.fsm.state import default_state
from aiogram.fsm.context import FSMContext
from states.order_state import OrderFood

order = []
available_pizza = ["Маргарита", "Пепперони", "Ветчина и сыр"]
available_sizes = ["Маленькая (25см)", "Средняя (30см)", "Большая (40см)"]

command_router = Router()

@command_router.message(CommandStart())
async def cmd_hello(message: Message):
    await message.answer("Добро пожаловать в ресторан PyPizza! Здесь вы можете оформить свой заказ")
    await message.answer(f"Hello, {html.bold(message.from_user.full_name)}!")
    await message.answer(r"Оформите заказ с помощью команды /order")

@command_router.message(StateFilter(None), Command("order"))
@command_router.message(StateFilter(None), F.text.lower().contains("добавить"))
async def cmd_food(message: Message, state: FSMContext):
    order = []
    row = [KeyboardButton(text=item) for item in available_pizza]
    kb = ReplyKeyboardMarkup(keyboard=[row], resize_keyboard=True)
    await message.answer(
        text="Выберите блюдо:",
        reply_markup=kb
    )
    await state.set_state(OrderFood.choosing_food_name)

@command_router.message(
    OrderFood.choosing_food_name,
    F.text.in_(available_pizza)
)
async def food_chosen(message: Message, state: FSMContext):
    row = [KeyboardButton(text=item) for item in available_sizes]
    row_1 = [KeyboardButton(text="Вернуться назад")]
    kb = ReplyKeyboardMarkup(keyboard=[row, row_1], resize_keyboard=True)
    await state.update_data(chosen_food=message.text)
    await message.answer(
        text="Спасибо. Теперь, пожалуйста, выберите размер порции:",
        reply_markup=kb
    )
    await state.set_state(OrderFood.choosing_food_size)

@command_router.message(OrderFood.choosing_food_size, F.text.lower().contains("назад"))
async def food_choose_back(message: Message, state: FSMContext):
    await state.clear()
    row = [KeyboardButton(text=item) for item in available_pizza]
    kb = ReplyKeyboardMarkup(keyboard=[row], resize_keyboard=True)
    await message.answer(
        text=f"Возвращаю на выбор пиццы",
        reply_markup=kb
    )
    await state.set_state(OrderFood.choosing_food_name)

@command_router.message(OrderFood.choosing_food_size, F.text.in_(available_sizes))
async def food_size_chosen(message: Message, state: FSMContext):
    user_data = await state.get_data()
    row = [KeyboardButton(text="Добавить товар"), KeyboardButton(text="Оплата")]
    row_1 = [KeyboardButton(text="Посмотреть заказ"), KeyboardButton(text='Отменить заказ')]
    kb = ReplyKeyboardMarkup(keyboard=[row, row_1], resize_keyboard=True)
    order.append(f"{user_data['chosen_food']}, {message.text}")
    await message.answer(
        text=f"Вы выбрали {user_data['chosen_food']}, {message.text}",
        reply_markup=kb
    )
    await state.clear()

@command_router.message(StateFilter(None), Command(commands=["cancel"]))
@command_router.message(default_state, F.text.lower() == "отмена")
async def cmd_cancel_no_state(message: Message, state: FSMContext):
    await state.set_data({})
    await message.answer(
        text="Нечего отменять",
        reply_markup=ReplyKeyboardRemove()
    )

@command_router.message(Command(commands=["cancel"]))
@command_router.message(F.text.lower() == "отмена")
async def cmd_cancel(message: Message, state: FSMContext):
    await state.clear()
    await message.answer(
        text="Действие отменено",
        reply_markup=ReplyKeyboardRemove()
    )


@command_router.message(F.text == 'my id')
async def command_my_id_handler(message: Message) -> None:
    await message.reply(f"Your id is: {message.from_user.id}!")


@command_router.message(F.photo != None)
async def command_my_photo_handler(message: Message) -> None:
    await message.reply(f"Nice photo!")


