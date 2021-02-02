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

Então('deverá aparecer o header de usuário') do
  @home.auth_header.has_user?
end
