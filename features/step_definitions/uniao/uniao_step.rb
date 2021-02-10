Dado('que tenha clientes com o mesmo nome') do
  @cadastro.uniaoFinal
end

Quando('unificar esses clientes') do
  @uniao = $ec_pages.uniao
  @uniao.unificar
end

Então('deverá aparecer a mensagem {string}') do |mensagem|
  expect(@home.message_op.text).to have_content mensagem
  @cadastro.exclui_cli(1)
end
