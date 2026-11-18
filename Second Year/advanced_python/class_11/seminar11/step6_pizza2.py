import asyncio
import logging
import sys

from numpy.random import randint

from aiogram import Bot, Dispatcher, html, F, Router
from aiogram.filters import CommandStart, Command
from aiogram.types import Message, KeyboardButton, ReplyKeyboardMarkup, KeyboardButtonPollType, InlineKeyboardButton, CallbackQuery, ReplyKeyboardRemove
from aiogram.utils.keyboard import InlineKeyboardBuilder
from aiogram.client.default import DefaultBotProperties
from aiogram.enums import ParseMode

from aiogram.fsm.context import FSMContext
from aiogram.fsm.state import StatesGroup, State
from aiogram.filters.state import StateFilter

TOKEN = '8498415193:AAGn30zRkwifcX9IBQ-ii2ef4gO_m_fdDcI'

dp = Dispatcher()

@dp.message(CommandStart())
async def command_start_handler(message: Message) -> None:
    """
    This handler receives messages with `/start` command
    """
    await message.answer(f"Hello, {html.bold(message.from_user.full_name)}!")


command_router = Router()

dp.include_router(command_router)

available_pizza = ["Маргарита", "Пепперони", "Ветчина и сыр"]
available_sizes = ["Маленькая (25см)", "Средняя (30см)", "Большая (40см)"]

class OrderFood(StatesGroup): #задаем класс для наших состояний
    choosing_food_name = State() # выбор пиццы
    choosing_food_size = State() # выбор размера


@command_router.message(StateFilter(None), Command("order")) # Добавляем фильтр на состояние (Пустое)
async def cmd_food(message: Message, state: FSMContext): # finite state machine context
    row = [KeyboardButton(text=item) for item in available_pizza]
    kb = ReplyKeyboardMarkup(keyboard=[row], resize_keyboard=True)
    await message.answer(
        text="Выберите блюдо:",
        reply_markup=kb
    )
    await state.set_state(OrderFood.choosing_food_name) #ставим ожидание выбора


@command_router.message(
    OrderFood.choosing_food_name,
    F.text.in_(available_pizza)
)

async def food_chosen(message: Message, state: FSMContext):
    row = [KeyboardButton(text=item) for item in available_sizes]
    kb = ReplyKeyboardMarkup(keyboard=[row], resize_keyboard=True)
    await state.update_data(chosen_food=message.text) # апдейт по состоянию
    await message.answer(
        text="Спасибо. Теперь, пожалуйста, выберите размер порции:",
        reply_markup=kb
    )
    await state.set_state(OrderFood.choosing_food_size) # следующее состояние

@command_router.message(OrderFood.choosing_food_size, F.text.in_(available_sizes))
async def food_size_chosen(message: Message, state: FSMContext):
    user_data = await state.get_data() # получаем всю скопленную информацию
    await message.answer(
        text=f"Вы выбрали {user_data['chosen_food']}, {message.text}", # тут ее можно использовать!
        reply_markup=ReplyKeyboardRemove() # Убираем клаву
    )
    await state.clear() #очищаем стейт


async def main() -> None:
    # Initialize Bot instance with default bot properties which will be passed to all API calls
    bot = Bot(token=TOKEN, default=DefaultBotProperties(parse_mode=ParseMode.HTML))
    # And the run events dispatching
    await dp.start_polling(bot)

if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO, stream=sys.stdout)
    asyncio.run(main())