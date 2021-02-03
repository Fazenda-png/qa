Dado('que esteja na Home') do
  @home = $ec_pages.home
  @login = $ec_pages.login
  @cadastro = $ec_pages.cadastro
  @home.load
end

Quando('acessar Login') do
  @home.abrir_login
end

Quando('realizar login com usuário válido') do
  @login.logar
end

Quando('realizar login com {string} e {string}') do |email, senha|
  @login.logar_erro(email, senha)
end

Então('deverá aparecer o header de usuário') do
  @home.auth_header.has_user?
end

Então('deverá aparecer o {string}') do |aviso|
  expect(@login.form).to have_content aviso
end
