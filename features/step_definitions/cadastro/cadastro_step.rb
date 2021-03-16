Dado('que esteja credenciado')do
  step 'que esteja na Home'
  step 'acessar Login'
  step 'realizar login com usuário válido'
end

Dado('que esteja em clientes') do
  @home.abrir_cliente
  @cadastro = $ec_pages.cadastro
end

Quando('cadastrar o cliente') do
  @cadastro.exclui_cli
  @cadastro.cadastro_exception
  @clientes = @cadastro.cadastrar
end

Quando('cadastrar o cliente com {string}, {string}, {string}') do |nome, email, cpf|
  @cadastro.cadastrar_erro(nome,email,cpf)
end

Então('deverá aparecer a mensagem') do
  mensagem = 'outro@mailsac.com'
  expect(@cadastro.mensagem).to have_content mensagem
  @cadastro.postCliente(@clientes)

end

Então('deverá aparecer a {string}') do |mensagemErro|
  expect(@cadastro.mensagemErro).to have_content mensagemErro
end
