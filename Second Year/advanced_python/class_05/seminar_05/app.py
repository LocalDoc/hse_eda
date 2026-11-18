
import aiohttp
import asyncio
import nest_asyncio
from aiohttp import web
from pyngrok import ngrok

async def handle(request):
    return web.Response(text="Hello, World!")

app = web.Application()
app.add_routes([web.get('/', handle)])

NGROK_AUTH_TOKEN = "2n4fGEnd6cpqK78u5FFyvyhaZ4s_3TNDWnemCPe5pvAqxBPSc"
ngrok.set_auth_token(NGROK_AUTH_TOKEN)

# Функция для запуска сервера
def start_server():
    loop = asyncio.get_event_loop()
    public_url = ngrok.connect(1337)
    print(f"Туннель запущен по URL: {public_url}")

    web.run_app(app, port=1337)     # Запуск веб-сервера aiohttp

asyncio.run(start_server())
