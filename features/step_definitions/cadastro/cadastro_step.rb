Dado('que esteja credenciado')do
  step 'que esteja na Home'
  step 'acessar Login'
  step 'realizar login com usuário válido'
  @cadastro = $ec_pages.cadastro
end

Dado('que esteja em clientes') do
  @home.abrir_cliente
end

Quando('preencher o formulário') do
  @clientes = @cadastro.cadastrar
  # binding.pry
end

Quando('preencher o formulário com {string}, {string}, {string}') do |nome, email, cpf|
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
