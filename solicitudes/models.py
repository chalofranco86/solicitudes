import uuid
from django.db import models

class Solicitud(models.Model):
    # Campos existentes
    nombre = models.CharField(max_length=100, verbose_name="Nombre del solicitante")
    proyecto = models.TextField(verbose_name="Descripción del proyecto")
    fecha = models.DateTimeField(auto_now_add=True, verbose_name="Fecha de creación")

    # ... otros campos ...
    dependencia_solicita = models.CharField(max_length=100)  # Quita null=True
    nombre_proyecto = models.CharField(max_length=100)
    responsable_dependencia = models.CharField(max_length=100)
    observaciones = models.TextField(blank=True, null=True)
    equipo = models.TextField(blank=True, null=True)
    cuenta_con_internet = models.BooleanField(default=False) 
    pdf = models.FileField(upload_to='solicitudes_pdf/', null=True, blank=True)
    uuid = models.UUIDField(default=uuid.uuid4, editable=False, unique=True)

    INTERNET_CHOICES = [
        ('SI', 'Sí'),
        ('NO', 'No'),
    ]
    cuenta_con_internet = models.CharField(
        max_length=2,
        choices=INTERNET_CHOICES,
        verbose_name="¿Cuentan con Internet?"
    )

    def __str__(self):
        return f"Solicitud de {self.nombre}"