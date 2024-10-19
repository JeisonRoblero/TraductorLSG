import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Drawer(
        backgroundColor: colorScheme.surface, // Fondo oscuro con transparencia
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/imgs/background_sign.jpg'), // Ruta de la imagen
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'Traductor de LSG',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: colorScheme.onSurface),
              title: Text('Inicio', style: TextStyle(color: colorScheme.onSurface)),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
                // Agrega la lógica para ir a la pantalla de inicio
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: colorScheme.onSurface),
              title: Text('Configuraciones', style: TextStyle(color: colorScheme.onSurface)),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
                // Agrega la lógica para abrir la pantalla de configuraciones
              },
            ),
            ListTile(
              leading: Icon(Icons.info, color: colorScheme.onSurface),
              title: Text('Acerca de', style: TextStyle(color: colorScheme.onSurface)),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
                // Agrega la lógica para mostrar la pantalla "Acerca de"
              },
            ),
          ],
        ),
      );
  }
}