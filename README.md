# Introdução

> Este projeto realiza a automação de testes (Front-end) do site [Meets](https://meets.com.br/).

O objetivo do projeto é focado em fixar atividades e práticas referentes à área de QA e aprender mais sobre a integração de Front-end e Back-end.

###### O projeto foi feito com base no template criado e disponibilizado por: 
- [Paulo Citron](https://www.linkedin.com/in/paulocesarcit/?originalSubdomain=br)
- [Leonardo Kartabil](https://www.linkedin.com/in/leo-kartabil/?originalSubdomain=br).
###### Autores:
- [Gabriel Forchesatto](https://github.com/GabrielForchesatto)
- [Guilherme Dalazen](https://github.com/Dalazen)
- [João Pedro Fazenda](https://github.com/Fazenda-png)
- [Luiz Gustavo](https://github.com/GustavoOliveira)

## Configuração para Desenvolvimento

Para rodar o projeto é necessário realizar alguns downloads em sua máquina

- [Ruby](https://rubyinstaller.org/downloads/) 
- [Cmder, caso use windows](https://cmder.net/)

> Após instalar o ruby (e o cmder) será necessário rodar alguns comandos em seu terminal
```sh
gem install win32console
gem install bundler
gem install ruby-debug-ide
```
> Então basta abrir o terminal na pasta do projeto e rodar o seguinte comando
```sh
bundle install
```

## Exemplo de uso

É possível testar as funcionalidades da seguinte forma:

- Login
```sh
cucumber -t @login
```
- Cadastro de cliente
```sh
cucumber -t @cadastro
```

### Dependências do template
- cucumber
- capybara
- report_builder
- faker
- rspec
- site_prism
- httparty
