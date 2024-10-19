import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:camera/camera.dart';
import 'package:sign_language_translator/features/translator/presentation/provider/translator_provider.dart';
import 'package:sign_language_translator/features/translator/presentation/widgets/app_drawer.dart';
import 'package:sign_language_translator/features/translator/presentation/widgets/blur_container.dart';

class Translator extends StatefulWidget {
  const Translator({super.key});

  @override
  State<Translator> createState() => _TranslatorState();
}

class _TranslatorState extends State<Translator> {
  late TranslatorProvider _provider;
  late ScrollController _scrollController; 
  Timer? frameTimer;

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<TranslatorProvider>(context, listen: false);
    _scrollController = ScrollController(); 

    // Inicia la cámara y la captura en tiempo real
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _provider.initializeCamera();
      startRealTimeCapture();
    });
  }

  // Empieza la captura en tiempo real de frames de la cámara
  void startRealTimeCapture() {
    frameTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) async {
      // Captura una imagen de la cámara en memoria sin guardarla en disco
      await _provider.takePictureAndSendToBackend();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    frameTimer?.cancel();  // Cancela el temporizador cuando se destruye el widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: colorScheme.surface.withOpacity(0.1),
        title: const Text("Traductor LSG", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera),
            onPressed: () async {
              // Cambia entre las cámaras disponibles
              await _provider.switchCamera();
            },
          ),
          IconButton(
            icon: const Icon(Icons.flip),
            onPressed: () {
              // Cambia la perspectiva de la cámara (invierte horizontalmente)
              _provider.toggleFlip();
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Consumer<TranslatorProvider>(
        builder: (context, provider, child) {
          if (provider.isCameraInitialized) {
            final size = MediaQuery.of(context).size;

            // Controla la posición de scroll cuando cambia el buffer
            if (provider.translationBuffer.isNotEmpty && _scrollController.hasClients) {
              _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
            }

            return Stack(
              children: [
                // Esto aplica el transform si isFlipped es verdadero
                Transform(
                  alignment: Alignment.center,
                  transform: provider.isFlipped ? Matrix4.rotationY(3.14159) : Matrix4.identity(),
                  child: SizedBox(
                    width: size.width,
                    height: size.height,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: 100,
                        child: CameraPreview(provider.cameraController!),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 130,
                  right: 10,
                  child: Column(
                    children: [

                      // Botón de cambiar cámara
                      BlurContainer(
                        backgroundColor: colorScheme.secondary.withOpacity(0.5),
                        child: IconButton(
                          tooltip: "Cambiar Cámara",
                          color: colorScheme.onSecondary,
                          icon: const Icon(Icons.cameraswitch, size: 25),
                          onPressed: () async {
                            // Cambia entre las cámaras disponibles
                            await _provider.switchCamera();
                          },
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Botón de invertir perspectiva
                      BlurContainer(
                        backgroundColor: colorScheme.secondary.withOpacity(0.5),
                        child: IconButton(
                          tooltip: "Invertir Cámara",
                          color: colorScheme.onSecondary,
                          icon: const Icon(Icons.flip, size: 25),
                          onPressed: () {
                            // Cambia la perspectiva de la cámara (invierte horizontalmente)
                            _provider.toggleFlip();
                          },
                        ),
                      ),  

                      const SizedBox(height: 10),

                      // Botón de silenciar
                      BlurContainer(
                        backgroundColor: colorScheme.secondary.withOpacity(0.5),
                        child: IconButton(
                          tooltip: "Silenciar / Escuchar",
                          icon: Icon(
                            _provider.isMuted ? Icons.volume_off : Icons.volume_up, // Cambia entre bocina y silencio
                            color: colorScheme.onSecondary,
                            size: 25,
                          ),
                          onPressed: () {
                            setState(() {
                              _provider.isMuted = !_provider.isMuted; // Cambia el estado de mute
                            });
                          },
                        ),
                      ),
                                         
                    ],
                  ),
                ),

                // Muestra la traducción en tiempo real en la parte inferior
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [

                      // Traducción en tiempo real
                      BlurContainer(
                        backgroundColor: colorScheme.onSurface.withOpacity(0.5),
                        borderRadius: 0.0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(16),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: provider.translationResult,
                                  style: TextStyle(color: colorScheme.surface, fontSize: 24),
                                ),
                                TextSpan(
                                  text: provider.confidenceResult.isNotEmpty ? "  --  " : "",
                                  style: TextStyle(color: colorScheme.surface, fontSize: 24),
                                ),
                                TextSpan(
                                  text: provider.confidenceResult,
                                  style: const TextStyle(color: Colors.greenAccent, fontSize: 24),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center, // Alineación del texto
                          ),
                        ),
                      ),

                      // Traducción acumulada
                      if (provider.translationBuffer.isNotEmpty)
                        BlurContainer(
                          backgroundColor: colorScheme.secondary.withOpacity(0.5),
                          borderRadius: 0.0,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [

                                // Botón de guardar buffer
                                IconButton(
                                  tooltip: "Guardar Traducción",
                                  icon: const Icon(
                                    Icons.save,
                                    color: Colors.blue,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    provider.saveTranslationBuffer();
                                  },
                                ),

                                Expanded(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    controller: _scrollController,
                                    child: Text(
                                      provider.translationBuffer, // Muestra el buffer acumulado
                                      style: TextStyle(color: colorScheme.surface, fontSize: 18),
                                      maxLines: 1, // Limita la cantidad de líneas
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 8.0),

                                // Botón de limpiar buffer
                                IconButton(
                                  tooltip: "Limpiar Traducción",
                                  icon: Icon(
                                    Icons.backspace_rounded,
                                    color: colorScheme.onSecondary,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    provider.clearTranslationBuffer();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Text(provider.errorMessage.isEmpty ? 'Cargando cámara...' : 'Inicialización de cámara'),
            );
          }
        },
      ),
    );
  }
}
