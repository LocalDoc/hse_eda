from aiogram import F, Router, Bot
from aiogram.types import Message
from aiogram.fsm.context import FSMContext
from aiogram.utils.keyboard import InlineKeyboardBuilder
from aiogram.types import Message, KeyboardButton, ReplyKeyboardMarkup, KeyboardButtonPollType, InlineKeyboardButton, Message, KeyboardButton, ReplyKeyboardMarkup, KeyboardButtonPollType, InlineKeyboardButton, CallbackQuery
from handlers.commands import order
from aiogram.enums import ParseMode
from aiogram.filters import Command
from random import randint

text_router = Router()


parrots = {1: 'https://glavnoehvost.by/upload/medialibrary/b39/eco9kya7tmtlxkdbgky3cuyb3rbs0mfv.jpg',
           2: 'https://avatars.mds.yandex.net/get-mpic/11396862/2a0000018c290b5f7aa193f4ebf41c9c4b77/orig',
           3: 'https://kotsobaka.com/wp-content/uploads/2018/08/2748131046_8a253489b5_b.jpg',
           4: 'https://get.wallhere.com/photo/parrot-bird-color-feathers-1091582.jpg',
           5: 'https://img2.akspic.ru/attachments/originals/7/8/6/4/84687-ara-nerazluchnik-dlinnohvostyj_popugaj-roza_kolchatoj_popugaj-klyuv-2560x1600.jpg',
           6: 'https://avatars.mds.yandex.net/i?id=3bba204af3c534feb91529b1ff1b56f7_l-4809943-images-thumbs&n=13'}

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



@text_router.message(F.text == 'parrot')
async def text_my_parrot_handler(message: Message) -> None:
    message.answer("PARROT")
    await message.react(reaction=[{"type": "emoji", "emoji": "👀"}])
    await message.reply_photo(parrots[randint(1, 7)])


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



## Добавляем кнопку с callback
@text_router.message(Command("random_number"))
async def cmd_random(message: Message):
    builder = InlineKeyboardBuilder()
    builder.add(InlineKeyboardButton(
        text="Тык",
        callback_data="random_number")
    )
    await message.answer(
        "Генерируй число!",
        reply_markup=builder.as_markup()
    )

# Обрабатываем сам callback
@text_router.callback_query(F.data == "random_number") #обратите внимание, тут смотрим не сообщение, а data, которую передали
async def send_random_value(callback: CallbackQuery):
    await callback.message.reply(str(randint(1, 100)))
    await callback.answer()


@text_router.message()
async def cmd_dont_know(message: Message):
    text = '''
    Простите, пожалуйста, не понимаю, что вы хотите сказать 😭
    '''
    await message.answer(text)
