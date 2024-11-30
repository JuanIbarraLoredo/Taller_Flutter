import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Web Workshop'),
          backgroundColor: Colors.purple,
        ),
        body: Row(
          children: [
            // Menú lateral modificado
            NavigationMenu(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Flutter Web Workshop',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 20),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 30,
                        ),
                        SizedBox(width: 500),
                        Icon(Icons.link),
                        SizedBox(width: 20),
                        Text('Share'),
                        SizedBox(width: 20),
                        Icon(Icons.more_vert),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 3,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: [
                          noteCard('Flutter Web Basics',
                              'Introducción a Flutter Web y su configuración.'),
                          noteCard('Widgets in Flutter',
                              'Uso de widgets como Column, Row y Container en Flutter Web.'),
                          noteCard('State Management',
                              'Gestión del estado en aplicaciones Flutter Web con Provider.'),
                          noteCard('Responsive Design',
                              'Adaptación de la interfaz para diferentes tamaños de pantalla.'),
                          noteCard('Navigation in Flutter Web',
                              'Navegación entre pantallas con Flutter Web y uso de rutas.'),
                          noteCard('Forms and Validation',
                              'Creación de formularios y validación de entrada en Flutter Web.'),
                          noteCard('Animations in Flutter',
                              'Implementación de animaciones y transiciones en Flutter Web.'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Menú lateral modificado con colores morados
  Widget NavigationMenu() {
    return Container(
      width: 280,
      color: Colors.purple[50],
      child: Column(
        children: [
          // Encabezado del menú
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            color: Colors.purple[600],
            child: Row(
              children: [
                Icon(Icons.apps, color: Colors.white, size: 30),
                const SizedBox(width: 10),
                Text(
                  'Flutter App',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Botones del menú con nombres en español
          menuItem(Icons.home, 'Inicio', () {}),
          menuItem(Icons.business, 'Negocios', () {}),
          menuItem(Icons.account_circle, 'Perfil', () {}),
          const Spacer(),
          menuItem(Icons.settings, 'Configuración', () {}),
          menuItem(Icons.group, 'Equipo', () {}),
          menuItem(Icons.add, 'Nueva Tarea', () {}),
          menuItem(Icons.add, 'Crear Proyecto', () {}),
        ],
      ),
    );
  }

  // Botón de menú personalizado
  InkWell menuItem(IconData icon, String text, Function onPressed) {
    return InkWell(
      onTap: () {
        onPressed();
        print(text);
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(icon, color: Colors.purple),
            const SizedBox(width: 10),
            Text(text, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }

  // Diseño de la tarjeta de notas
  Widget noteCard(String title, String description) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple[50],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 15,
                width: 15,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(description),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.purple[100]),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  child: Text(
                    'Editar',
                    style: TextStyle(
                      color: Colors.purple[700],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
