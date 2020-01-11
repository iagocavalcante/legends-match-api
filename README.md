# Legends Match v1

O primeiro passo é instalar as dependencias com: 

```shell
bundle install
```

Feito isso é necessário ter o banco de dados postgres rodando, atualizar as credenciais do banco no .env e rodar os seguintes comandos:

```shell
rake db:create

rake db:migrate
```

No projeto temos o swagger e ele é baseado nos testes do rspec que se encontram na pasta spec, após atualizar os testes e quiser gerar uma nova documentação da api, é só executar o comando: 

```shell
rake rswag:specs:swaggerize
```


# Padrões Adotados

O padrão de commit que é usado na aplicação é chamado [semantic commit](https://www.conventionalcommits.org/en/v1.0.0/)

Quando chegarmos num mvp, vamos tentar usar tags para marcar a versão estável da api e da aplicação e seguir usando o padrão de tags pra releases


# Regras de negócio

- [ ] Login utilizando JWT
- [ ] Listar usuários que tenham interesses similares ao usuário que está logado
- [ ] Listar usuários que estejam num raio pré estabelecido nas configurações do usuário
- [ ] Ação de like: quando usuário executar essa ação, armazenar o id do usuário que recebeu o like no campo likes do usuário logado
- [ ] Ação de dislike: quando usuário executar essa ação, armazenar o id do usuário que recebeu o dislike no campo dislikes do usuário logado
- [ ] Ação de match: quando usuário executar o like, armazenar o id do usuário que recebeu o like no campo likes do usuário logado e verificar se o id do usuário logado se encontra na coluna de likes do usuário que recebeu like e informar em tempo real que aconteceu o match
- [ ] Lista de matchs: exibir usuários que deram match e disponibilizar um canal de chat privado entre os usuários
- [ ] Ação de editar perfil: permitir usuário logado de editar seus dados
- [ ] Realizar integração com Steam - Só com assinatura
- [ ] Realizar integração com Riot - De graça
- [ ] Realizar integração com Twitch - Só com assinatura
- [ ] Toogle exibir perfis de usuário independente dos interesses
- [ ] Favoritar conversa com match
- [ ] Exibir status online/offline 
- [ ] Exibir status in game - Só com assinatura
- [ ] Matchs ilimitados - Só com assinatura
