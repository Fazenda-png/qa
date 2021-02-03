Dado("que esteja logado") do
  step 'que esteja na Home'
  step 'acessar Login'
  step 'realizar login com usuário válido'
  @Oportunidade = $ec_pages.oportunidades
end

Dado("esteja na pagina de oportunidades") do
  @home.abrir_oportunidades.click
  @btnOp = @Oportunidade.listagem
  @btnOp.btn_cadastro.gclick
end

Quando("preencher os campos") do
  @form = @Oportunidade.formulario
  @form.cadastraOportunidade
end

Então("deverá aparecer {string}") do |mensagem|
  expect(@home.message_op.text).to eql mensagem
end

Quando('preencher os campos {​​string}​​, {​​string}​​, {​​string}​​, {​​string}​​, {​​string}​​') do |string, string2, string3, string4, string5|
  pending # Write code here that turns the phrase above into concrete actions
end

Quando('preencher os campos do contato {​​string}​​, {​​string}​​') do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end

Então('deverá aparecer {​​string}​​{​​string}​​') do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end
