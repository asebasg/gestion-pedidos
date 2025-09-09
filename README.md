# Sistema de Gestión de Pedidos

## Descripción del Proyecto

Este proyecto es un mini-sistema de gestión de pedidos desarrollado en Dart, aplicando conceptos avanzados de programación orientada a objetos, asincronía y manejo de errores. El sistema simula un entorno de pedidos en línea donde clientes pueden crear pedidos, repartidores los entregan, y se manejan estados en tiempo real.

## Requerimientos Cumplidos

### Inicio del proyecto práctico

- ✅ Clases abstractas (Usuario), enums (EstadoPedido), extends (Cliente), implements (Repartidor), mixins (Notificacion).
- ✅ Getters y setters con validaciones (Pedido).
- ✅ Futures y async/await (cargarPedido).
- ✅ Try/catch/finally (buscarPedido).
- ✅ Streams, async\* y await (seguimientoPedido).

### Desarrollo guiado

- ✅ Simulación de carga con Future.delayed.
- ✅ Uso de async y await.
- ✅ Manejo de errores con try/catch/finally.
- ✅ Validaciones con aserciones (assert).

### Streams y presentación final

- ✅ Stream que emite cambios de estado (pendiente → procesando → enviado → entregado).
- ✅ Uso de async\* y await para generar estados.
- ✅ Proyecto completo funcionando.

## Estructura del Código

### Clases Principales

#### 1. Usuario (Clase Abstracta)

- **Propósito**: Representa un usuario genérico del sistema.
- **Métodos**: `login()` (abstracto).
- **Subclases**: Cliente, Repartidor.

#### 2. EstadoPedido (Enum)

- **Valores**: pendiente, procesando, enviado, entregado.
- **Uso**: Controla el estado de cada pedido.

#### 3. Pedido

- **Propiedades**: producto (String), precio (double), estado (EstadoPedido).
- **Métodos**:
  - Constructor con assert para validar precio >= 0.
  - Getter `totalConImpuestos`: Calcula precio con 19% de IVA.
  - Setter `aplicarDescuento`: Aplica descuento con validación (0-100%, máximo 50%).

#### 4. Cliente (Extiende Usuario, Usa Mixin Notificacion)

- **Propiedades**: `pedidos (List<Pedido>)`.
- **Métodos**:
  - `login()`: Imprime mensaje de inicio de sesión.
  - `agregarPedido()`: Agrega pedido y envía notificación.

#### 5. Entregable (Interfaz)

- **Métodos**: `entregarPedido(Pedido pedido)`.

#### 6. Repartidor (Extiende Usuario, Implementa Entregable)

- **Métodos**:
  - `login()`: Imprime mensaje de inicio de sesión.
  - `entregarPedido()`: Cambia estado a entregado y notifica.

#### 7. Notificacion (Mixin)

- **Métodos**: `enviarNotificacion(String mensaje)`: Imprime mensaje en consola.

### Funciones Asíncronas

#### 8. cargarPedido()

- **Tipo**: `Future<Pedido>`
- **Descripción**: Simula carga desde "servidor" con delay de 2 segundos.
- **Manejo de Errores**: Lanza excepción si `forzarError` es true.

#### 9. buscarPedido()

- **Tipo**: Pedido?
- **Descripción**: Busca pedido por nombre en lista.
- **Manejo de Errores**: Try/catch/finally para excepciones.

#### 10. seguimientoPedido()

- **Tipo**: `Stream<EstadoPedido>`
- **Descripción**: Emite estados secuenciales con delays de 5 segundos cada uno.

## Cómo Ejecutar el Proyecto

### Prerrequisitos

- Dart SDK instalado (versión 2.12 o superior).
- Editor de código como VS Code con extensión de Dart.

### Pasos de Ejecución

1. Clona o descarga el proyecto.
2. Abre la carpeta del proyecto en tu editor.
3. Ejecuta el comando:

   ```bash
   dart run pedidos.dart
   ```

4. Observa la salida en la consola, que simula todo el flujo del sistema.

### Salida Esperada

- Inicio de sesión de usuarios.
- Creación y validación de pedido.
- Aplicación de descuento.
- Notificación de pedido agregado.
- Búsqueda exitosa de pedido.
- Carga asíncrona de pedido.
- Seguimiento de estados en tiempo real.
- Entrega final del pedido.

## Funcionalidades Clave

- **Validaciones**: Precios no negativos, descuentos válidos.
- **Asincronía**: Simulación de carga y estados en tiempo real.
- **Manejo de Errores**: Try/catch/finally en búsquedas y carga.
- **Notificaciones**: Mensajes al agregar pedidos.
- **Streams**: Actualización continua de estados.

## Entregables

- ✅ Código ejecutable que simula carga de pedidos y valida datos.
- ✅ Proyecto completo funcionando con todos los temas aplicados.
- ✅ Documentación clara (este README).

Este proyecto demuestra el dominio de conceptos avanzados de Dart en un contexto práctico de gestión de pedidos.
