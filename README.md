```markdown
# Flutter Posts App

Esta es una aplicación Flutter que muestra un listado de posts. Al tocar uno de los posts, se abre una pantalla de detalle que muestra los comentarios asociados a ese post. Además, permite al usuario darle like a un post, y este valor se refleja en cada ítem del listado de posts.

## Requisitos

- Flutter SDK
- Un editor de código como Visual Studio Code o Android Studio
```
## Instalación

1. Clona este repositorio:

   ```bash
   git clone https://github.com/chiuchiolo30/challenge.git
   ```

2. Navega al directorio del proyecto:

   ```bash
   cd challenge
   ```

3. Instala las dependencias:

   ```bash
   flutter pub get
   ```

## Ejecución

1. Conecta un dispositivo o inicia un emulador.
2. Ejecuta la aplicación:

   ```bash
   flutter run
   ```

## Estructura del Proyecto

- `main.dart`: Punto de entrada de la aplicación.
- `core/`: Contiene clases y utilidades que son usadas en varias partes del proyecto (por ejemplo, manejo de errores).
- `features/posts/`: Contiene todo lo relacionado con la funcionalidad de los posts.
  - `data/`: Contiene fuentes de datos y modelos.
  - `domain/`: Contiene entidades, repositorios y casos de uso.
  - `presentation/`: Contiene implementación de la IU utilizando Flutter Bloc.
- `injection_container.dart`: Configuración de la inyección de dependencias.

## Funcionalidades

- Listar posts.
- Mostrar detalles de un post.
- Listar comentarios de un post.
- Darle like a un post.

## Fuentes de Datos

Los posts y comentarios se obtienen utilizando los siguientes endpoints:

- **Posts**: `https://jsonplaceholder.typicode.com/posts`
- **Comments**: `https://jsonplaceholder.typicode.com/comments?postId=1` (cambiando el `postId` según sea necesario)

## Dependencias

El proyecto utiliza las siguientes dependencias:

- `bloc`: Para la gestión del estado.
- `bloc_test`: Para pruebas unitarias de los blocs.
- `build_runner`: Para generar código.
- `dartz`: Para programación funcional.
- `dio`: Para realizar solicitudes HTTP.
- `equatable`: Para facilitar la comparación de objetos.
- `flutter_bloc`: Para la integración de Flutter con Bloc.
- `get_it`: Para la inyección de dependencias.
- `mockito`: Para la creación de mocks en pruebas unitarias.

## Ejecución de Pruebas Unitarias

Para ejecutar las pruebas unitarias, utiliza el siguiente comando:

```bash
flutter test
```

Este comando ejecutará todas las pruebas definidas en el proyecto y mostrará los resultados en la terminal.

## Funcionalidades

- Listar posts.
- Mostrar detalles de un post.
- Listar comentarios de un post.
- Darle like a un post.

## Fuentes de Datos

Los posts y comentarios se obtienen utilizando los siguientes endpoints:

- **Posts**: `https://jsonplaceholder.typicode.com/posts`
- **Comments**: `https://jsonplaceholder.typicode.com/comments?postId=1` (cambiando el `postId` según sea necesario)
## Licencia

Este proyecto está licenciado bajo la Licencia MIT. Para más detalles, consulta el archivo [LICENSE](LICENSE).