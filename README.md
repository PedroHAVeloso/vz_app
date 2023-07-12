  # VZ App

Aplicativo em Flutter que retorna frases aleatórias de 'velha do zap'.

> Figma do aplicativo: [figma.com/community/file/1258821624890062447](https://www.figma.com/community/file/1258821624890062447)
> 
> API usada pelo aplicativo: [github.com/PedroHAVeloso/vz_api](https://github.com/PedroHAVeloso/vz_api)

### Funcionalidades:
>- Retornar várias frases, entre o minímo de 1 e máximo de 10.
>- Favoritar frases para salvá-las nos celular.
>- Copiar frases geradas.

### Ainda para se implementar:
>- Tema escuro.
>- Ícone e nome do aplicativo na tela inicial.


### Prints do aplicativo:
<div width="100%" align="center">
  <img width="24%" src="https://raw.githubusercontent.com/PedroHAVeloso/vz_app/Develop/app_prints/print01.png">
  <img width="24%" src="https://raw.githubusercontent.com/PedroHAVeloso/vz_app/Develop/app_prints/print02.png">
  <img width="24%" src="https://raw.githubusercontent.com/PedroHAVeloso/vz_app/Develop/app_prints/print03.png">
  <img width="24%" src="https://raw.githubusercontent.com/PedroHAVeloso/vz_app/Develop/app_prints/print04.png">
</div>

## Rodando o aplicativo:
### Aviso:
> Para o funcionamento correto do aplicativo, clone a [VZ API](https://github.com/PedroHAVeloso/vz_api) e siga o passo a passo , que está em seu repositório, para iniciá-la.
> 
> Após isso, entre no arquivo do aplicativo `/vz_app/lib/datasources/phrases_datasource.dart` e atribua à constante `apiUrl` a url em que a VZ API está rodando.

Se você tiver o [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado em seu computador, siga os seguintes passos:

Após clonar o repositório, inicie o seu emulador de prefêrencia, podendo ser tanto de Android quanto de iOS, abra o terminal dentro da pasta `vz_app` e digite:

	$ flutter pub get

Em seguinte, para iniciar o app:

	$ flutter run
	
## Dependências do aplicativo:
Para comunicaçação com a API:
- [`http: ^1.1.0`](https://pub.dev/packages/http)

Para uso de imagens em formato SVG:
- [`flutter_svg: ^2.0.7`](https://pub.dev/packages/flutter_svg)

Para o gerenciamento de estado:
- [`flutter_bloc: ^8.1.3`](https://pub.dev/packages/flutter_bloc)

Para salvar frases no armazenamento local:
- [`hive: ^2.2.3`](https://pub.dev/packages/hive)
- [`hive_flutter: ^1.1.0`](https://pub.dev/packages/hive_flutter)
- [`hive_generator: ^2.0.0`](https://pub.dev/packages/hive_generator)
