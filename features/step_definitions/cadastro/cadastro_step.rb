
Dado('que esteja credenciado')do
  @home = $ec_pages.home
  @login = $ec_pages.login
  @cadastro = $ec_pages.cadastro
  @home.load
  @home.abrir_login
  @login.logar
end

Dado('que esteja em clientes') do
  @home.abrir_cliente
end

Quando('preencher o formulário') do
  @cadastro.cadastrar
end

Quando('preencher o formulário com {string}, {string}, {string}') do |nome, email, cpf|
  @cadastro.cadastrar_erro(nome,email,cpf)
end

Então('deverá aparecer a mensagem') do
  mensagem = 'Test Automation'
  expect(@cadastro.mensagem).to have_content mensagem
end

Então('deverá aparecer a {string}') do |mensagemErro|
  expect(@cadastro.mensagemErro).to have_content mensagemErro
end
