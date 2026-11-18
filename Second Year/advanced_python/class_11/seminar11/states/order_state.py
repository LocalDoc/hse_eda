from aiogram.fsm.state import StatesGroup, State

class OrderFood(StatesGroup):
    choosing_food_name = State()
    choosing_food_size = State()

class GetLocation(StatesGroup):
    has_location = State()
    has_name = State()
    has_phone = State()