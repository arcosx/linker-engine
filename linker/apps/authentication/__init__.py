from django.apps import AppConfig


class AuthenticationAppConfig(AppConfig):
    name = 'linker.apps.authentication'
    label = 'authentication'
    verbose_name = 'Authentication'

    def ready(self):
        import linker.apps.authentication.signals


default_app_config = 'linker.apps.authentication.AuthenticationAppConfig'
