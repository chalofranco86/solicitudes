# Generated by Django 4.2.16 on 2025-02-24 20:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('solicitudes', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='solicitud',
            name='cuenta_con_internet',
            field=models.CharField(choices=[('SI', 'Sí'), ('NO', 'No')], max_length=2, verbose_name='¿Cuentan con Internet?'),
        ),
    ]
