import asyncio
import logging
import sys

from numpy.random import randint

from aiogram import Bot, Dispatcher, html, F, Router
from aiogram.filters import CommandStart, Command
from aiogram.types import Message, KeyboardButton, ReplyKeyboardMarkup, KeyboardButtonPollType, InlineKeyboardButton, CallbackQuery, ReplyKeyboardRemove, InlineQuery, InlineQueryResultArticle, InputTextMessageContent
from aiogram.utils.keyboard import InlineKeyboardBuilder
from aiogram.client.default import DefaultBotProperties
from aiogram.enums import ParseMode

from aiogram.fsm.context import FSMContext
from aiogram.fsm.state import StatesGroup, State
from aiogram.filters.state import StateFilter

from handlers.commands import order

TOKEN = '8498415193:AAGn30zRkwifcX9IBQ-ii2ef4gO_m_fdDcI'

dp = Dispatcher()

text_router = Router()
dp.include_router(text_router)


@text_router.message(F.text.lower() == 'что это')
async def cmd_faq(message: Message):
    text = '''
    Привет! Это бот для заказа пиццы из нашей очень популярной пиццерии! 🦜
    Ты можешь сделать заказ с помощью команды /order
    '''
    await message.answer(text)

@text_router.message(F.text.lower() == 'посмотреть заказ')
async def cmd_lookup(message: Message):
    if len(order) == 0:
        await message.answer("В корзине пусто 😭", parse_mode=ParseMode.HTML)
    else:
        text = "Вот ваш заказ: \n"
        for i in order:
            text += f"<b> {i} </b> \n"
        await message.answer(text, parse_mode=ParseMode.HTML)

@text_router.message(F.text == 'Отменить заказ')
async def cmd_cancel_all(message: Message, state: FSMContext):
    order.clear()
    await state.clear()
    await message.answer("Ваш заказ отменен")

@text_router.message(F.text.lower() == 'оплата')
async def cmd_cancel_all(message: Message, state: FSMContext):
    order.clear()
    await state.clear()
    await message.answer("Отправили ваш заказ, ожидайте!")

@text_router.message()
async def cmd_dont_know(message: Message):
    text = '''
    Простите, пожалуйста, не понимаю, что вы хотите сказать 😭
    '''
    await message.answer(text)


async def main() -> None:
    # Initialize Bot instance with default bot properties which will be passed to all API calls
    bot = Bot(token=TOKEN, default=DefaultBotProperties(parse_mode=ParseMode.HTML))
    # And the run events dispatching
    await dp.start_polling(bot)

if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO, stream=sys.stdout)
    asyncio.run(main())