from django.urls import path
from . import views
from .views import descargar_pdf
from .views import listar_solicitudes
from .views import inicio_solicitudes
from django.contrib.auth import views as auth_views

urlpatterns = [
    path('accounts/login/', auth_views.LoginView.as_view(), name='login'),
    path('crear/', views.crear_solicitud, name='crear_solicitud'),
    path('exito/<int:solicitud_id>/', views.exito, name='exito'),  # Asegúrate de que esta línea exista
    path("pdf/<uuid:uuid>/", views.descargar_pdf, name="descargar_pdf"),
    path('listar/', listar_solicitudes, name='listar_solicitudes'),
    path('', inicio_solicitudes, name='inicio_solicitudes'),
]