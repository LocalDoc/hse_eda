import asyncio
import logging
import sys

from aiogram import Bot, Dispatcher, html, F, Router
from aiogram.filters import CommandStart, Command
from aiogram.types import Message, KeyboardButton, ReplyKeyboardMarkup, KeyboardButtonPollType, InlineKeyboardButton
from aiogram.utils.keyboard import InlineKeyboardBuilder
from aiogram.client.default import DefaultBotProperties
from aiogram.enums import ParseMode

TOKEN = '8498415193:AAGn30zRkwifcX9IBQ-ii2ef4gO_m_fdDcI'

dp = Dispatcher()

@dp.message(CommandStart())
async def command_start_handler(message: Message) -> None:
    """
    This handler receives messages with `/start` command
    """
    await message.answer(f"Hello, {html.bold(message.from_user.full_name)}!")

    text_router = Router()

text_router = Router()

dp.include_router(text_router)

@text_router.message(Command("inline_url"))
async def cmd_inline_url(message: Message, bot: Bot):
    builder = InlineKeyboardBuilder()
    builder.row(InlineKeyboardButton(
        text="GitHub", url="https://github.com")
    )
    builder.row(InlineKeyboardButton(
        text="Оф. канал Telegram",
        url="tg://resolve?domain=telegram")
    )
    await message.answer(
        'Выберите ссылку',
        reply_markup=builder.as_markup(),
    )

async def main() -> None:
    # Initialize Bot instance with default bot properties which will be passed to all API calls
    bot = Bot(token=TOKEN, default=DefaultBotProperties(parse_mode=ParseMode.HTML))
    # And the run events dispatching
    await dp.start_polling(bot)

if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO, stream=sys.stdout)
    asyncio.run(main())