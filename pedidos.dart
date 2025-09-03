import 'dart:async';
// Sistema de pedidos para usuarios
// 1. Clase abstracta de Usuario

//variables globales:
bool forzarError = false;

abstract class Usuario {
  String nombre;
  Usuario(this.nombre);

  // Método abstracto
  void login();
}

// 2. Enumeración EstadoPedido
enum EstadoPedido { pendiente, procesando, enviado, entregado }

// 3. Clase Pedido
class Pedido {
  String producto;
  double precio;
  EstadoPedido estado;

  Pedido(this.producto, this.precio, this.estado) {
    // fix: Usar una aserción para evitar precios negativos
    assert(precio <= 0, 'El precio no puede ser negativo');
  }
  // TODO: Crear getter para total con impuestos
  double get totalConImpuestos => precio * 1.19;
  // TODO: Crear setter para aplicar descuento con validación
  set aplicarDescuento(double porcentaje) {
    assert(porcentaje >= 0 && porcentaje <= 100, 'Descuento inválido');

    if (porcentaje >= 50) {
      print(
        "Descuento no aplicado: el porcentaje es demasiado alto (mas de 50%)",
      );
      return;
    }

    double descuento = precio * (porcentaje / 100);
    precio -= descuento;
    print("Descuento aplicado: ${precio}");
  }
}

// 4. Clase Cliente (extiende Usuario)
class Cliente extends Usuario {
  List<Pedido> pedidos = [];
  Cliente(String nombre) : super(nombre);
  @override
  void login() {
    print("Cliente $nombre ha iniciado sesión.");
  }

  void agregarPedido(Pedido pedido) {
    pedidos.add(pedido); // Agrega los pedidos al array
  }
}

// 5. Interfaz Entregable
abstract class Entregable {
  void entregarPedido(Pedido pedido);
}

// 6. Clase Repartidor (implements Entregable)
class Repartidor extends Usuario implements Entregable {
  Repartidor(String nombre) : super(nombre);

  @override
  void login() {
    print("El repartidor $nombre ha iniciado sesion.");
  }

  @override
  void entregarPedido(Pedido pedido) {
    print("El producto ${pedido.producto} solicitado está ${pedido.estado}");
    pedido.estado = EstadoPedido.entregado;
    print("El producto ${pedido.producto} ha sido entregado.");
  }
}

// 7. Mixin Notificacion
mixin Notificacion {
  void enviarNotificacion(String mensaje) {
    print("Nueva notificación: $mensaje");
  }
}

// 8. Simulación con Future
Future<Pedido> cargarPedido() async {
  return Future.delayed(Duration(seconds: 2), () {
    if (forzarError) {
      throw Exception('Error en la conexión de red');
    }
    return Pedido("Producto X", 100.0, EstadoPedido.pendiente);
  });
}

// 9. Manejo de errores con Try / Catch
Pedido? buscarPedido(List<Pedido> pedidos, String producto) {
  try {
    for (var pedido in pedidos) {
      if (pedido.producto == producto) {
        return pedido;
      }
    }
  } on Exception catch (e) {
    print("Ha ocurrido una excepcion: $e");
  } catch (e) {
    print("Ha ocurrido un error fatal: $e");
  } finally {
    print("Proceso de búsqueda finalizado.");
  }
  return null;
}

// 10. Stream de actualizaciones de estado
Stream<EstadoPedido> seguimientoPedido() async* {
  yield EstadoPedido.pendiente;
  await Future.delayed(Duration(seconds: 5));
  yield EstadoPedido.procesando;
  await Future.delayed(Duration(seconds: 5));
  yield EstadoPedido.enviado;
  await Future.delayed(Duration(seconds: 5));
  yield EstadoPedido.entregado;
  await Future.delayed(Duration(seconds: 5));
}

void main(List<String> args) async {
  try {
    Pedido pedido = Pedido("Producto X", 10000, EstadoPedido.pendiente);
    print("precio original: ${pedido.precio}");
    print("total con impuesto: ");
    pedido.aplicarDescuento = 30;
    print("precio final con descuento: ");
  } catch (e) {
    print("error al cargar el pedido: $e");
  }
}
