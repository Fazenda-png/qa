Dado('que tenha clientes com o mesmo nome') do
  @uniao = $ec_pages.uniao
  nomes = @uniao.validar
  pending unless (nomes != nil)? true : false
end

Quando('unificar esses clientes') do
  @uniao.unificar
end

Então('deverá aparecer a mensagem {string}') do |mensagem|
  expect(@home.message_op.text).to have_content mensagem
  @cadastro.exclui_cli
  
end
