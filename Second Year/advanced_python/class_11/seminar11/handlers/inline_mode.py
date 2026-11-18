from aiogram import Router
from aiogram.types import InlineQuery, InlineQueryResultArticle, InputTextMessageContent


inline_router = Router()

@inline_router.inline_query()
async def show_user_links(inline_query: InlineQuery):
    commands = [r"/start", r"/order"]
    descriptions = ["Инфо", "Сделать заказ"]

    results = []
    for i in range(len(commands)):
        results.append(InlineQueryResultArticle(
            id=str(i),
            title=commands[i],
            description=descriptions[i],
            input_message_content=InputTextMessageContent(message_text=commands[i])
        ))
    await inline_query.answer(results)