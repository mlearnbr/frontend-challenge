# Desafio front-end

## Arquitetura

Optei por utilizar uma arquitetura em que pudesse aplicar testes mas que não tivessem camadas desnecessárias para o pequeno escopo do projeto, ou seja, um domínio definido com interfaces e camadas com responsabilidades bem claras.


* Camada de domínio (Domain): contém as entidades e interfaces dos repositórios e controllers.
* Camada de Aplicação (Application): contém as implementações dos controllers responsáveis por manter a lógica da aplicação.
* Camada de infraestrutura (Infrastructure): contém as implementações dos repositórios responsáveis por fazer a conexão com a API. 
* Camada de apresentação (Presentation): contém os widgets e páginas do aplicativo.

Com essa estrutura o projeto é completamente testável e foi desenvolvido orientado a testes.


## Principais bibliotecas utilizadas
* [Mobx](https://pub.dev/packages/mobx) para gerenciamento de estados.
* [GetIt](https://pub.dev/packages/get_it) para injeçãoo de dependências.
* [DartZ](https://pub.dev/packages/dartz) para programação funcional.
* [Mocktail](https://pub.dev/packages/mocktail) para testes.


## Estrutura das Pastas
Como o projeto tinham features com escopo bem definido desenvolvi o projeto utilizando o padrão feature-first.

```
lib
├── features
│   └── character_list
│      ├── presentation
│      ├── application
│      ├── domain
│      └── infrastructure
├── core
│   ├── configs
│   │   ├── router
│   │   └── injection
│   ├── failures
│   ├── network
│   ├── services
│   │   └── http
│   └── widgets
└── main.dart
```
