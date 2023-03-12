# Aplicativo Star Wars

Aplicativo com o propósito de exibir informações dos personagens da saga Star Wars, através do consumo da API:
> API: https://swapi.dev/documentation#people
## Packages

- [Mobx](https://pub.dev/packages/flutter_mobx): como gerência de estado.
- [flutter_modular](https://pub.dev/packages/flutter_modular): injeção de dependências e gerenciamento de rotas.
- [Http](https://pub.dev/packages/http): cliente HTTP para consumo da API.
- [Slidy](https://pub.dev/packages/slidy): utilizado para script, criação de módulos.

## Instalação do projeto

1. Clone o projeto.

2. Abra o projeto através de sua IDE de preferência.

3. Digite ou cole no terminal os códigos abaixo:

```bash
flutter pub get
```
```bash
slidy run
```
4. Selecione a opção no terminal "mobx_watch_build_clean".

5. Após feito isso, já é possível debugar o projeto.

6. Caso não tenha o package "slidy" instalado, siga o passo a passo [aqui](https://pub.dev/packages/slidy).

## Testes

1. Abra a pasta test do projeto.

2. Abra os arquivos com o final _test.dart.

3. Clique em Run ou Debug acima de cada teste.

4. Se o teste passou, aparecerá o ícone "check".
## Arquitetura

- Camada de domínio (Domain): contém as entidades, interfaces dos repositórios, usecases e erros de caso de uso.
- Camada externa (External): contém as implementações de acessos externos.
- Camada de infraestrutura (Infra): contém as implementações dos repositórios, dando suporte a Domain.
- Camada de apresentação (Presenter): contém os widgets e páginas do aplicativo. 

## Screenshots
<table>
  <tr>
     <td>Home</td>
     <td>Home with filter</td>
     <td>Details Page - Info</td>
     <td>Details page - Films</td>
  </tr>
  <tr>
    <td><img src="https://github.com/Nbosso/natan-bosso/tree/natan-bosso/flutter_star_wars/assets/screenshots/home.jpeg" width=270 ></td>
    <td><img src="https://github.com/Nbosso/natan-bosso/tree/natan-bosso/flutter_star_wars/assets/screenshots/home_with_filter.jpeg" width=270 ></td>
    <td><img src="https://github.com/Nbosso/natan-bosso/tree/natan-bosso/flutter_star_wars/assets/screenshots/detail_info.jpeg" width=270 ></td>
    <td><img src="https://github.com/Nbosso/natan-bosso/tree/natan-bosso/flutter_star_wars/assets/screenshots/detail_films.jpeg" width=270 ></td>
  </tr>
 </table>

## Melhorias futuras

Melhorar o layout do aplicativo, realizar testes utilizando mock, novas funcionalidades e corrigir possíveis bugs.


