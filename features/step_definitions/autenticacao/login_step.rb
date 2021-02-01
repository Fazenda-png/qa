Dado('que esteja na Home') do
  @home = $ec_pages.home
  @login = $ec_pages.login
  @home.load
end

Quando('acessar Login') do
  @home.abrir_login
end

Quando('realizar login com {string} e {string}') do |login, senha|
  @login.logar(login, senha)
end

Então('deverá aparecer o header de usuário') do
  @home.auth_header.has_user?
end
