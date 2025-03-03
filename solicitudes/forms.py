from django import forms
from .models import Solicitud

class SolicitudForm(forms.ModelForm):
    cuenta_con_internet = forms.ChoiceField(
        choices=Solicitud.INTERNET_CHOICES,  # Usa las opciones del modelo
        widget=forms.RadioSelect,
        label="¿Cuentan con Internet?",
        required=True
    )

    class Meta:
        model = Solicitud
        fields = [
            'nombre', 
            'dependencia_solicita',
            'nombre_proyecto',
            'responsable_dependencia',
            'proyecto',
            'observaciones',
            'equipo',
            'cuenta_con_internet'
        ]

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        
        # Personalización de cada campo
        self.fields['nombre'].widget.attrs.update({
            'class': 'form-control form-control-lg',
            'placeholder': 'Ingresa tu nombre completo',
            'style': 'border-radius: 10px;'
        })

        self.fields['dependencia_solicita'].widget.attrs.update({
            'class': 'form-control',
            'placeholder': 'Ej: Departamento de TI',
            'style': 'border-radius: 10px;'
        })

        self.fields['nombre_proyecto'].widget.attrs.update({
            'class': 'form-control',
            'placeholder': 'Ej: Sistema de Gestión de Tareas',
            'style': 'border-radius: 10px;'
        })

        self.fields['responsable_dependencia'].widget.attrs.update({
            'class': 'form-control',
            'placeholder': 'Ej: Juan Pérez',
            'style': 'border-radius: 10px;'
        })

        self.fields['proyecto'].widget.attrs.update({
            'class': 'form-control',
            'placeholder': 'Describe tu proyecto aquí...',
            'rows': 5,
            'style': 'border-radius: 10px; resize: none;'
        })

        self.fields['observaciones'].widget.attrs.update({
            'class': 'form-control',
            'placeholder': 'Ej: Requiere aprobación del director',
            'rows': 3,
            'style': 'border-radius: 10px; resize: none;'
        })

        self.fields['equipo'].widget.attrs.update({
            'class': 'form-control',
            'placeholder': 'Ej: Laptop, Router, Impresora',
            'rows': 3,
            'style': 'border-radius: 10px; resize: none;'
        })

        # Personalización especial para el checkbox
        self.fields['cuenta_con_internet'].widget.attrs.update({
            'class': 'form-check-input',
            'style': 'width: 20px; height: 20px; margin-left: 10px;'
        })
        self.fields['cuenta_con_internet'].widget.attrs.update({
            'class': 'form-check-input',
        })