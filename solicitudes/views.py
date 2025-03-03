from django.shortcuts import render, redirect
from django.shortcuts import get_object_or_404
from django.core.files.base import ContentFile
from django.http import FileResponse
from django.contrib.auth.decorators import login_required, permission_required
from reportlab.pdfgen import canvas
from .forms import SolicitudForm
from .models import Solicitud
from .utils import generar_pdf  # Asegúrate de crear este archivo utils.py
from django.template.loader import render_to_string
from django.http import HttpResponse
from xhtml2pdf import pisa
from django.template.loader import get_template
from io import BytesIO
from django.shortcuts import render
import tempfile
import io

def crear_solicitud(request):
    if request.method == 'POST':
        form = SolicitudForm(request.POST)
        if form.is_valid():
            # Guardar la solicitud y obtener la instancia
            solicitud = form.save()
            
            # Generar el PDF
            context = {'solicitud': solicitud}
            pdf_content = generar_pdf('solicitudes/pdf_template.html', context)
            
            if pdf_content:
                # Crear nombre único para el PDF
                nombre_archivo = f"solicitud_{solicitud.id}.pdf"
                # Guardar el PDF en el modelo
                solicitud.pdf.save(nombre_archivo, ContentFile(pdf_content), save=True)
            
            return redirect('exito', solicitud_id=solicitud.id)
        else:
            return render(request, 'solicitudes/crear_solicitud.html', {'form': form})
    else:
        form = SolicitudForm()
    return render(request, 'solicitudes/crear_solicitud.html', {'form': form})

def exito(request, solicitud_id):
    solicitud = Solicitud.objects.get(id=solicitud_id)
    return render(request, 'solicitudes/exito.html', {'solicitud': solicitud})  # ¡Ruta completa!

@login_required
@permission_required('solicitudes.view_solicitud', raise_exception=True)
def listar_solicitudes(request):
    solicitudes = Solicitud.objects.all()
    return render(request, 'solicitudes/listar.html', {'solicitudes': solicitudes})

@login_required
@permission_required('solicitudes.view_solicitud', raise_exception=True)

def descargar_pdf(request, uuid):
    solicitud = get_object_or_404(Solicitud, uuid=uuid)
    
    # Renderiza la plantilla HTML
    template = get_template('solicitudes/pdf_template.html')
    html = template.render({'solicitud': solicitud})
    
    # Crea un buffer para el PDF
    buffer = BytesIO()
    
    # Genera el PDF
    pisa_status = pisa.CreatePDF(html, dest=buffer)
    
    # Verifica errores
    if pisa_status.err:
        return HttpResponse('Error al generar el PDF', status=500)
    
    # Devuelve el PDF
    buffer.seek(0)
    response = HttpResponse(buffer, content_type='application/pdf')
    response['Content-Disposition'] = f'attachment; filename="solicitud_{solicitud.uuid}.pdf"'
    return response

def inicio_solicitudes(request):
    return render(request, 'solicitudes/inicio.html') 