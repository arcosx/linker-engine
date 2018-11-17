from django.apps import AppConfig


class CardsAppConfig(AppConfig):
    name = 'linker.apps.cards'
    label = 'cards'
    verbose_name = 'Cards'

    # def ready(self):
    #     import linker.apps.cards.signals


default_app_config = 'linker.apps.cards.CardsAppConfig'
