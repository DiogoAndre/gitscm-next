# Git Homepage [![Build Status](https://secure.travis-ci.org/github/gitscm-next.png?branch=master)](http://travis-ci.org/github/gitscm-next)

Esta é a aplicação web para o site [git-scm.com.br](http://git-scm.com.br). O objetivo é que este seja o primeiro lugar que uma pessoa nova ao Git chegue para baixar e aprender sobre o sistema Git SCM.

Este aplicativo é escrito em Ruby on Rails e implantado no Heruko.

## Instalação

Você vai precisar de um ambiente Ruby para rodar o Rails. Para começar faça:

    $ rvm use 1.9.2
    $ bundle install

Depois você precisa criar a estrutura do banco de dados:

    $ rake db:migrate

Agora você deve popular as páginas do manual (man). Você pode fazer isso a partir de um clone local do código fonte Git:

    $ GIT_REPO=../git/.git rake local_index

Ou pode fazer a partir do GitHub(muito mais lento) assim:

    $ rake preindex

Você precisa baixar os downloads mais atuais para a página de downloads:

    $ rake downloads

Agora você vai provavelmente querer o dados do livro. É preciso de acesso ao projeto progit através da API do GitHub.

    $ export API_USER=github_username
    $ export API_PASS=github_password
    $ rake remote_genbook

Isso vai gerar o conteúdo do livro a partir dos arquivos markdown buscados no repositório online e vai colocá-los no banco de dados do servidor Rails. 

Agora você pode rodar o servidor Rails para dar uma olhada no resultado. Especifique um UPDATE_TOKEN para que possa usar o mecanismo de autenticação mais ridículo do mundo:

    $ UPDATE_TOKEN=something rails server

O site deve estar rodando em http://localhost:3000


## Testando

Para roda os testes para este projeto, faça:

    $ rake test

Para rodar o website para fins de teste, faça:

    $ bundle exec rackup config.ru

## Contribuindo

Se desejar contribuir com este website, por favor [fork no GitHub](https://github.com/github/gitscm-next), envie suas mudanças para um branch nomeado, e me envie um pull request. Se for uma grande mudança, talvez seja melhor entrar em contato primeiro, para ter certeza que é algo que será aceito. Se envolver código, por favor inclua testes para ele.

## Licença

Este código fonte está licenciado sob a licença MIT, que pode ser encontrada no arquivo MIT-LICENSE.txt.

Todo o conteúdo gráfico está licenciado sob a
[Creative Commons Attribution 3.0 Unported License](http://creativecommons.org/licenses/by/3.0/).
