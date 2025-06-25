# ProjetoFlutter

## Aplicativo de Aniversário (BDAY)

Um aplicativo Flutter de listagem e lembrete de datas de aniversários.

### Projeto desenvolvido por Luiz Felipe Hildebrant e Rafael Boldt Rodrigues de Souza

### Funcionalidades
- Visualização de aniversários por meio do calendário
- Listagem dia a dia
- Listagem de todos os aniversários
- Adição, exclusão e edição de aniversários;
- Personalização do Perfil
- Uso de banco de dados Firebase
- Uso de API para obtenção dos feriados no calendário
- Uso de notificações ao abrir o app ou logar em sua  conta
### Funcionalidades Faltantes 
- Salvar dados do perfil na banco de dados
- Personalização da foto de perfil
### Atividades Desenvolvidas

  1. Rafael

    Model:aniversario_list,usuario,aniversario,db_firestore,feriado

    Controller:aniversario_list_view,aniversario_editar,date_picker,auth_check,feriado_api

    View:aniversario_cadastrar,aniversarios_editar,aniversarios_view,meu_aplicativo,aniversario_list,date_picker,input_counter,auth_check
  2. Luiz

    Model:aniversario_list,data

    Controller:perfil,calendario,notification_controller

    View:tela_padrao,perfil,calendario,meu_aplicativo,login
### Instruções de Instalação

**Pré-requisitos**
- Flutter instalado
- Editor VScode
- Rodar o aplicativo em um celular ou por meio de emulador

 1. Clone este projeto em seu computador
 2. Acesse a pasta do projeto por meio do terminal
    ```
    cd seu_projeto
    ```
 4. Instale as dependências
    ```
    flutter pub get
    ```
 6. Execute o projeto
    ```
    flutter run
    ```
